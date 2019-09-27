import string

str = "Up and down went the seesaw. Up it went.  Down it went.  Up, up, up!"


for char in string.punctuation:
    str = str.replace(char," ")

allwords = str.lower().split(" ")

d = dict()

def isInList(l,w):
    for elem in l:
        if w==l:
            return True
    return False

for word in allwords:
    if word not in d.keys():
        d[word] = 1
    else:
        d[word] += 1
        
import csv
f = open('/tmp/blah.csv','w')
c = csv.DictWriter(f,["Student","Grades"])
allstudents = ["Alex","Simo","Petr"]
allgrades = [85,50,90]
for i in range(0,3):
    d = dict()
    d["Student"] = allstudents[i]
    d["Grades"] = allgrades[i]
    c.writerow(d)
f.close()

f = open('/tmp/gaga.txt','r')
for line in f:
    print len(line.split())


def unique(x):    
    # if i got to a letter i've seen before, i would ignore it
    d = dict()
    for letter in x:
        # if i've seen letter before, ignore it
        if letter not in d.keys():
            d[letter] = 1
        else:
            d[letter] = d[letter]+1
    return len(d.keys())

def unique(x):
    # make the word into a set
    return len(set(x.upper()))

def countunique(str):
    d = dict()
    for k in range(1,27):
        d[k] = 0
    # do something to every word
    for word in str.split():
        k = unique(word)
        d[k] += 1
    return d

def ex3(l):
    import csv
    f = open('/tmp/ex3.csv','w')
    nums = range(1,27)
    c = csv.DictWriter(f,nums)
    for str in l:
        c.writerow(countunique(str))
    f.close()
    
mylist = ["The world is a nice place.", "Today is Friday!","Hello to all of you"]

ex3(mylist)

import re
str = "Joseph Schmoe (15), Bowling High Score:(199), Phone:(934) 292-239066, SSN:295-48-2311"
print re.findall("\((\d\d\d)\)",str)
print re.findall("\w+:",str)
print re.findall("Phone:\((\d\d\d)\)",str)

str = "I Called his phone after he phoned me, but he has two phones! What a phoney!"
print re.findall("phone",str)
print re.findall("phone\w+",str)
print re.findall("phone\w*",str)
print re.findall("phone[sdy]+",str)
