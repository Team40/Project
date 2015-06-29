echo "Retrieving articles from PubMed..."
sudo curl "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&reldate=4&datetype=edat&retmax=2000" -o output.xml
echo "Articles retrieved. Parsing..."
sudo python3 parser.py
echo "Complete."