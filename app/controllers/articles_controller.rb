class ArticlesController < ApplicationController
  def new
    Rails.logger.info "new-endpoint"
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
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
