class ArticlesController < ApplicationController
before_action :article_params, only: [:create, :update]
before_action :article_find, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def show
    @article = article_find
  end

  def edit
    @article = article_find
  end

  def update
    @article = article_find
    @article.update(article_params)

    redirect_to articles_path
  end

  def destroy
    @article = article_find
    @article.destroy
    redirect_to articles_path
  end

  private

  ## Strong Params
  def article_find
    Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end


