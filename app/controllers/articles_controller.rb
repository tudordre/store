class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    if @article.nil?
      redirect_to articles_path, alert: "Articolul nu a fost găsit."
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
