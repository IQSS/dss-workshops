# This is example code for use with the Wing IDE tutorial, which
# is accessible from the Help menu of the IDE

# NOTE: This code contains deliberate errors used for illustration
# purposes when working through the tutorial

import os
import stat
import time
import urllib

# NOTE:  This import will not work unless you follow the directions
# in the tutorial to set your PYTHONPATH
from path_example import *

#-----------------------------------------------------------------------
def GetItemCount():
  """This gets the number of items to use in this example"""
  return 5

#-----------------------------------------------------------------------
def ReadPythonNews(count, force=0):
  """Reads news and project list from python.org news channel"""

  newscache = 'newscache.rdf'
  
  txt = None
  if not force and os.path.exists(newscache):    
    mtime = os.stat(newscache).st_mtime
    if time.time() - mtime < 60 * 60 * 24:
      f = open(newscache)
      txt = f.read()
      f.close()
      
  if txt is None:
    try:
      svc = urllib.urlopen("http://www.python.org/channews.rdf")
      txt = svc.read()
      svc.close()
    except:
      return kCannedData
    f = open(newscache, 'w')
    f.write(txt)
    f.close()
      
  if len(txt) == 0:
    return []

  news = ParseRDFNews(txt)
  
  return news[:count]
  
#-----------------------------------------------------------------------
def PrintAsText(news):
  for date, event, url in news:
    print("%s -- %s (%s)" % (date, event, url))
   
#-----------------------------------------------------------------------
def PrintAsHTML(news):
  for date, event, url in news:
    # NOTE: The line below contains a deliberate typo
    print('<p><i>%s</i> <a href="%s">%s</a></p>' % (data, url, event))
    

##########################################################################
# Enter code according to the tutorial here:

news = ReadPythonNews(GetItemCount())
PrintAsText(news)
PrintAsHTML(news)