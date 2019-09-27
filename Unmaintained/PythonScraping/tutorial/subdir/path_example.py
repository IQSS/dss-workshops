# This file exists mainly to illustrate setting PYTHONPATH in the tutorial
# accessible from the Help menu in Wing IDE

import xml.sax
import xml.sax.handler

#-----------------------------------------------------------------------
class CHandler(xml.sax.handler.ContentHandler):
  """Parser handler class for parsing news from python.org"""
  
  def __init__(self):
    xml.sax.handler.ContentHandler.__init__(self)
    self.fItems = []
    self.__fCurItem = None
    self.__fText = []
    
  def startElement(self, name, attrs):
    if name == 'item':
      self.__fCurItem = {}
    self.__fText = []
    
  def endElement(self, name):
    if name == 'item':
      self.fItems.append(self.__fCurItem)
      self.__fCurItem = None
    elif self.__fCurItem is not None:
      self.__fCurItem[name] = ''.join(self.__fText).strip()
      
  def characters(self, content):
      self.__fText.append(content)
    
#-----------------------------------------------------------------------
def ParseRDFNews(txt):
  """Utility to parse XML from the python.org RDF news feed"""
  
  news = []
  
  try:
    try:
      h = CHandler()
      p = xml.sax.parseString(txt, h)
    except:
      # This is a common formatting error
      txt = txt.replace('&', '&amp;')
      h = CHandler()
      p = xml.sax.parseString(txt, h)    
  except:
    return kCannedData
  
  for item in h.fItems:
    d = ' '.join(item['pubDate'].split()[:4])
    news.append([d, item['title'], item['guid']])
    
  return news

#-----------------------------------------------------------------------
# Canned data to use when no internet connection is available
kCannedData = [
  ['Mon, 15 Oct 2007 20:45 -0400', 'PyCon 2008: Call for Talk & Tutorial Proposals', 'http://www.python.org/news/index.html#Mon15Oct20072045-0400'],
  ['Tue, 11 Sep 2007 5:50 -0600', 'Texas Regional Python Unconference in Houston This Weekend Sep 15-16', 'http://www.python.org/news/index.html#Tue11Sep2007550-0600'],
  ['Fri, 31 Aug 2007 12:00 -0500', 'Python 3000 released as Python 3.0a1', 'http://www.python.org/news/index.html#Fri31Aug20071200-0500'],
  ['Sat, 25 Aug 2007 12:10 -0500', 'Coming soon: PyWeek #5 - Python Game Programming Challenge', 'http://www.python.org/news/index.html#Sat25Aug20071210-0500'],
  ['Thu, 23 Aug 2007 16:10 +0200', 'New Python Bugtracker', 'http://www.python.org/news/index.html#Thu23Aug200716100200'],
]

