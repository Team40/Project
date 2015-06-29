from Bio import Entrez
import sys
import os
import xml.etree.ElementTree as ElementTree
import webbrowser


'''
This script uses the Entrez API to fetch the article data for the 2000 article IDs 
in output.xml (outputted by Scraper.sh script) from the PubMed database. Only articles 
with abstracts are saved. An arbitrary score is assigned to articles as a placeholder for 
user-voted scores (yet to be implemented).
'''

tree = ElementTree.parse('output.xml')
root = tree.getroot()
raw_articles_file = open('articles.txt', 'w')
df = open('datafile.txt', 'w')

IDs = []
print ("The IDs of the latest 2000 PubMed articles are:")
for idList in root:
	for ID in idList.iter('Id'):
		print (ID.text)
		IDs.append(ID.text)


Entrez.email = "zmeza@stanford.edu"
handle = Entrez.efetch("pubmed", id=IDs, retmode="xml")
records = Entrez.parse(handle)
count = 0
score = 500
for record in records:
	if(score > 100):
		score -= 10
	elif(score > 10):
		score -= 1

	#We only save articles that have an abstract field in PubMed
	if 'Abstract' in record['MedlineCitation']['Article']:
		count += 1
		title = record['MedlineCitation']['Article']['ArticleTitle']
		pmid = record['MedlineCitation']['PMID']
		abstract = record['MedlineCitation']['Article']['Abstract']['AbstractText'][0]
		date = record['MedlineCitation']['DateCreated']['Month'] + "/" + record['MedlineCitation']['DateCreated']['Day'] + "/" + record['MedlineCitation']['DateCreated']['Year']


		raw_articles_file.write("Title #%s: " % str(count))
		raw_articles_file.write(title + "\n")
		raw_articles_file.write("PMID: " + pmid + "\n")
		raw_articles_file.write("Authors: ")
		if 'AuthorList' in record['MedlineCitation']['Article']:
			authors = record['MedlineCitation']['Article']['AuthorList']


		author_s = ""
		for i, author in enumerate(authors):
			if 'ForeName' in author:
				fullName = ""
				firstName = author['ForeName']
				initials = ""
				if 'Initials' in author: 
					initials = author['Initials']
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
