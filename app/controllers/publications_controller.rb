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
