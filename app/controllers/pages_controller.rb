class PagesController < ApplicationController

	##DEPRECATED
  def index

  end

  def publication
  	@data = ''
  	f = File.open("/Users/zachmeza/Web/ruby-getting-started/scripts/datafile.txt")
  	f.each_line do |line|
  		line = line.gsub("<<", '')
   		line = line.gsub(">>", '')
  		@data += line
  	end
  end
end
