from lxml import etree
import shutil
import csv     
import urllib
import re

def scrapeSingle(num):
	f = open('/tmp/parsed'+str(num)+'.csv','w')
	entries = ["Day","Month","Year","Title","Remote","Local"]
	c = csv.DictWriter(f,entries)
		
	baseurl = "http://www.egyptindependent.com/subchannel/News%20features?page="
	destpath = "/tmp/"
	urllib.urlretrieve (baseurl+str(num),destpath+"page"+str(num)+".html")
	print "Retrieved page: " + str(num)
	
	fname = '/tmp/page'+str(num)+'.html'
	fp = open(fname, 'rb')
	parser = etree.HTMLParser()
	tree   = etree.parse(fp, parser)
	dateelems = tree.xpath('.//div[@class="views-field-field-published-date-value"]/span[@class="field-content"]/span[@class="date-display-single"]')
	linkelems = tree.xpath('.//div[@class="panel-pane pane-views pane-subchannel-news subchannel-pane"]//div[@class="views-field-title"]/span[@class="field-content"]/a')
	for (d,l) in zip(dateelems,linkelems):
		entry = dict()
		myDate = d.text.split()
		urlname = l.get('href')
		nodenum = re.search("\d+",urlname).group()
		dest = destpath+nodenum+".html"
		urllib.urlretrieve (urlname,dest)
		entry["Day"] = myDate[0]
		entry["Month"] = myDate[1]
		entry["Year"] = myDate[2]
		entry["Local"] = dest
		entry["Remote"] = urlname
		entry["Title"] = l.text.encode("utf-8")
		c.writerow(entry)
		print entry     
		
		fp.close()			
		
if __name__ == '__main__':
	basepath = '/tmp/out'
	print "foo"
	nfiles = 3 #1219 when full
	for i in range(1,nfiles+1):
		scrapeSingle(i)
	destination = open('/tmp/files.csv','wb')
	basepath = '/tmp/parsed'
	print "Merging records into single csv file..."
	for i in range(1,nfiles):
		shutil.copyfileobj(open(basepath+str(i)+'.csv','rb'), destination)
	destination.close()
	print "...complete!"