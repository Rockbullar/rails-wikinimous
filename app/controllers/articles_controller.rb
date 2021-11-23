class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    article = Article.new(art_params)
    article.save
    redirect_to article_path(article)
  end

  def new
    @new_article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
	  if @article.update(art_params)
		  redirect_to article_path(@article)
	  end
  end

  def destroy
    article = Article.find(params[:id])
	  if article.destroy
		  redirect_to articles_path
	  end
  end

  private

  def art_params
    params.require(:articles).permit(:title, :content)
  end
end
