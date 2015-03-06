class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	#Default page for /welcome
  	@publications = Publication.all

    f = File.open("/Users/zachmeza/Web/ruby-getting-started/scripts/datafile.txt")

    pubs = []
    f.each_line do |line|

      vals = line.split("<<")

      id = vals[1].sub(">>", "")
      title = vals[2].sub(">>", "")
      authors = vals[3].sub(">>", "")
      abstract = vals[4].sub(">>", "")
      date = vals[5].sub(">>", "")

      arr = ["pmid" => id, "title" => title, "authors" => authors, "abstract" => abstract, "date" => date]

      pubs.push(arr)

    end

    @pubs = pubs

    publications = [
        ["title" => "Pericytes Are the Progenitors of Epicardial-Derived Smooth Muscle Cells in the Heart", "category" => "Stem Cell Biology"],
        ["title" => "The CD47-Signal Regulatory Protein Alpha (SIRPa) Interaction is a Therapeutic Target for Human Solid Tumors", "category" => "Development & Evolution"],
        ["title" => "Mesenchymal Stem Cells Support Neuronal Fiber Growth in an Organotypic Brain Slice Model", "category" => "Neuroscience, Neurology & Psychiatry"],
        ["title" => "Thermogenic Activity of UCP1 in Human White Fat-Derived Beige Adipocytes", "category" => "Public Health & Epidemiology"]
    ]

    @publications = publications
  end

end
