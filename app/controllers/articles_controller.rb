class ArticlesController < ApplicationController
  
  #Only index, show, new and edit pages have views
  #Create, update, and destroy only perform some kind of action

  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to articles_path, :notice => "Your article was saved"
  	else
  		render "new"
  	end
  end

  #form on the edit page will submit to the update action, which affects DB
  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
  	if @article.update_attributes(article_params)
  		redirect_to articles_path, :notice => "updated"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to articles_path, :notice => "deleted"
  end

  def article_params
  	params.require(:article).permit(:title, :content, :timestamp)
  end
end
