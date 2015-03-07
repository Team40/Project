class PublicationsController < ApplicationController

	def index 
	  	#@publications = Publication.all
	    #f = File.open("/Users/zachmeza/Web/ruby-getting-started/scripts/datafile.txt")
	    @pubs = Publication.all
	end


	def show
		#@test = "test"
		@publication = Publication.where(:pmid => params['pmid']).first
	end


	def new

	end


	def create

	end


	def edit

	end


	def update
		f = File.open("/Users/zachmeza/Web/ruby-getting-started/scripts/datafile.txt")



		title = "Pericytes Are the Progenitors of Epicardial-Derived Smooth Muscle Cells in the Heart"
		id = 25037571
		authors = "K.S. Volz, H. Chen, A. Poduri, A. McKay, A. Jacobs, I.Weissman, K. Red-Horse"
		abst = "Context: The coronary arteries are one of the medically most relevant vessels. They are often affected in diseases like atherosclerosis leading to blockage of the coronary arteries eventually results in heart attacks. If we want to regenerate the coronary arteries or help them during disease we first need to know how they are build up. What is Known: It is known that epicardial cells, which are the cells on the surface of the heart, eventually turn into smooth muscle cells deep in the heart. Smooth muscle cells are an essential cell type around the coronary arteries which is very important for homeostasis and is often affected in diseases like atherosclerosis. What is Not Known: Since epicardial cells and coronary artery smooth muscle cells never appear together we know that there must be a progenitor cell linking both cell types. Experimental Question: We wanted to discover the progenitor cell derived from the epicardium which differentiates into coronary artery smooth muscle cells. Main Findings: We discovered that pericytes, which are an important cell type wrapping around small blood vessels, are the progenitor cells to smooth muscle cells. Epicardial cells differentiate into pericytes and pericytes differentiate into coronary artery smooth muscle cells when they are located at a specialized zone in the heart called the remodeling zone and receive arterial blood flow. Implications: If we know where smooth muscle cells in the heart come from, then we might be able to block this pathway during diseases with excessive smooth muscle cells (like atherosclerosis). Furthermore, since we show that pericytes still stick around in adult hearts they may be natural progenitors which could be recruited after injury or for smooth muscle cell homeostasis."
		date = "3/7/2015"
		score = 600

		@publication = Publication.new(:pmid => id, :title => title, :authors => authors, :date => date, :abstract => abst, :score => score)
		@publication.save

	    f.each_line do |line|

	    	vals = line.split("<<")
			id = vals[1].sub(">>", "")
			title = vals[2].sub(">>", "")
			authors = vals[3].sub(">>", "")
			abstract = vals[4].sub(">>", "")
			date = vals[5].sub(">>", "")
			score = vals[6].sub(">>", "").to_i

			@publication = Publication.new(:pmid => id, :title => title, :authors => authors, :date => date, :abstract => abstract, :score => score)
			@publication.save

	    end
	end

	def destroy

	end

	def publication_params
	    params.require(:pmid).permit(:title,:authors,:date,:abstract,:score)
	end


end
