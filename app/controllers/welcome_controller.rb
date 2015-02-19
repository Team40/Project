class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	#Default page for /welcome
  	@articles = Article.all

    publications = [
        ["title" => "Pericytes Are the Progenitors of Epicardial-Derived Smooth Muscle Cells in the Heart", "category" => "Stem Cell Biology"],
        ["title" => "The CD47-Signal Regulatory Protein Alpha (SIRPa) Interaction is a Therapeutic Target for Human Solid Tumors", "category" => "Development & Evolution"],
        ["title" => "Mesenchymal Stem Cells Support Neuronal Fiber Growth in an Organotypic Brain Slice Model", "category" => "Neuroscience, Neurology & Psychiatry"],
        ["title" => "Thermogenic Activity of UCP1 in Human White Fat-Derived Beige Adipocytes", "category" => "Public Health & Epidemiology"]
    ]

    @publications = publications
  end

end
