# This is example code for use with the Wing IDE tutorial, which
# is accessible from the Help menu of the IDE

import htmllib

class MyHTMLParser(htmllib.HTMLParser):
  """An example that helps to illustrate some of Wing IDE's features"""
  
  def __init__(self, formatter, verbose=0):
    """Constructor"""
    htmllib.HTMLParser.__init__(self, formatter, verbose)
    self.pre_count = 0
    
  def end_pre(self):
    """Overridden to count number of completed <pre></pre> blocks"""
    self.pre_count += 1
    htmllib.HTMLParser.end_pre(self)

class AnotherClass:
  """Just for filler"""

  class NestedClass:
    """Example of a nested class"""
    pass
  
  def __init__(self, obj):
    
    isinstance(obj, MyHTMLParser)

    def nested_function1():
      """Example of a nested function"""
      print("nested1")
      
    def nested_function2():
      """Another example of a nested function"""
      print("nested2")

    self.obj = obj
    
  def A(self):
    pass
  
  def B(self):
    pass
  
a = AnotherClass(MyHTMLParser())

