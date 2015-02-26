sudo curl "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&reldate=4&datetype=edat&retmax=20" -o output.xml
sudo python3 parser.py

