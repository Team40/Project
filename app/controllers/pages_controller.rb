class PagesController < ApplicationController
  def index
  	@filetext = File.read("scripts/datafile.txt")
  end

  def publication
  end
end
