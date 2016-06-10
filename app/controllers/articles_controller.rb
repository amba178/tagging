class ArticlesController < ApplicationController
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    if @article.save
      redirect_to @article, notice: "Created article."
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params_article)
      redirect_to @article, notice: "Updated article."
    else
      render :edit
    end
  end

  private 
  	def params_article
  		params.require(:article).permit(:content, :name, :tag_list)
  	end
end
