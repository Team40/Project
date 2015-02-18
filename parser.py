import sys
import os
import xml.etree.ElementTree as ElementTree
import webbrowser


tree = ElementTree.parse('output.xml')
root = tree.getroot()

print "IDList:"

IDs = []

for idList in root:
	for ID in idList.iter('Id'):
		print ID.text
		IDs.extend([ID.text])

count = 0
urls = []
for ID in IDs:
	print "ID #%d = %s" % (count, ID)
	url = "http://www.ncbi.nlm.nih.gov/pubmed/%s\n" % ID
	webbrowser.get('open -a /Applications/Google\ Chrome.app %s').open_new(url)
	urls.extend(url)
	count+=1

f = open('urls.txt', 'w')
for url in urls:
	f.write(url)




#root1 = tree.getroot()
#for root2 in root1:
#	for child in root2:
#		print child.tag, child.attrib

