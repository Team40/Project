class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	#Default page for /welcome
  	@articles = Article.all
  end

end
