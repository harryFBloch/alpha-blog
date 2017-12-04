class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def new 
    @article = Article.new
  end
  
  def edit
  
  end
  
  def update
    
    if @article.update(article_params)
      flash[:success] = "Article was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def create
    #render plaifasdfn: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.last
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
      
    end
  end
  
  def show
    
  end
  
  def index
    @articles = Article.all
  end
  
  def destroy
   
    @article.destroy
    flash[:danger] = "article was sucessfully deleted"
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
end