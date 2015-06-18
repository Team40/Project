from Bio import Entrez
import sys
import os
import xml.etree.ElementTree as ElementTree
import webbrowser


tree = ElementTree.parse('output.xml')
root = tree.getroot()
f = open('articles.txt', 'w')
r = open('raw.txt', 'w')
df = open('datafile.txt', 'w')


IDs = []

print ("IDList:")
for idList in root:
	for ID in idList.iter('Id'):
		print (ID.text)
		IDs.extend([ID.text])

Entrez.email = "zmeza@stanford.edu"
handle = Entrez.efetch("pubmed", id=IDs, retmode="xml")
records = Entrez.parse(handle)
count = 0
score = 500
for record in records:
	r.write(str(record))
	if(score > 100):
		score -= 10
	elif(score > 10):
		score -= 1

	if 'Abstract' in record['MedlineCitation']['Article']:
		count += 1

		title = record['MedlineCitation']['Article']['ArticleTitle']
		pmid = record['MedlineCitation']['PMID']
		abstract = record['MedlineCitation']['Article']['Abstract']['AbstractText'][0]

		date = record['MedlineCitation']['DateCreated']['Month'] + "/" + record['MedlineCitation']['DateCreated']['Day'] + "/" + record['MedlineCitation']['DateCreated']['Year']


		f.write("Title #%s: " % str(count))
		f.write(title + "\n")

		f.write("PMID: " + pmid + "\n")

		f.write("Authors: ")
		if 'AuthorList' in record['MedlineCitation']['Article']:
			authors = record['MedlineCitation']['Article']['AuthorList']


		author_s = ""
		for i, author in enumerate(authors):

			if 'ForeName' in author:
				fullName = ""
				firstName = author['ForeName']
				if 'Initials' in author: 
					initials = author['Initials']
				else:
					initials = ""
				lastName = author['LastName']

				if not firstName: 
					firstName = ""
				else:
					if len(firstName) == 1: firstName += "."
					firstName += " "
					fullName += firstName

				if initials: 
					ins = initials.split()
					initials = ""
					for tok in ins:
						initials += tok + "."
					initials += " "
					fullName += initials

				if i + 1 < len(authors):
					lastName += ", "

				fullName += lastName
				author_s += fullName

				f.write(firstName + initials + lastName)
		f.write("\n")
		f.write("Abstract: ")
		f.write(abstract + "\n\n\n")

		df.write("<<%s>><<%s>><<%s>><<%s>><<%s>><<%s>>\n" % (pmid, title, author_s, abstract, date, score))
handle.close()




#root1 = tree.getroot()
#for root2 in root1:
#	for child in root2:
#		print child.tag, child.attrib



	#webbrowser.get('open -a /Applications/Google\ Chrome.app %s').open_new(url)
