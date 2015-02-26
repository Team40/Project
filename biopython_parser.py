from Bio import Entrez

idst = "257070"
id_list = []

for i in range(45, 64):
	id_list.append(idst + str(i))

Entrez.email = "zmeza@stanford.edu"
handle = Entrez.efetch("pubmed", id=id_list, retmode="xml")
records = Entrez.parse(handle)
for record in records:
	#f.write(str(record))

	if 'Abstract' in record['MedlineCitation']['Article']:
		print "\nTitle:"
		print record['MedlineCitation']['Article']['ArticleTitle'] + "\n"
		print "Abstract:"
		print record['MedlineCitation']['Article']['Abstract']['AbstractText'][0]
		print "\n"

handle.close()