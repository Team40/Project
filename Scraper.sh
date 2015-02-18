sudo curl "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&reldate=1&datetype=edat" -o output.xml
sudo python parser.py

