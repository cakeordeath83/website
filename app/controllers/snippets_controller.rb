class SnippetsController < ApplicationController
  
  before_action :find_snippet, only: [:show, :update, :edit, :destroy]
  add_breadcrumb "GUIDES", :snippets_path
  
  def index
    if params[:category]
      @snippets = Snippet.where(:category => params[:category])      
    else
       @snippets = Snippet.all
    end
    @allsnippets = Snippet.all
   
 end
  
  def new
    @allsnippets = Snippet.all
    @snippet = Snippet.new
  end
  
  def create 
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      redirect_to snippet_path(@snippet)
    else
      render :new
    end
  end
  
  def show
    add_breadcrumb "#{@snippet.title.upcase}", snippet_path(@snippet)
  end
  
  def edit
    @snippets = Snippet.all
  end
  
  def update
    if @snippet.update(snippet_params)
      redirect_to snippet_path(@snippet)
    else
      render :edit
    end
  end
  
  private
  
  def snippet_params
    params.require(:snippet).permit(:title, :content, :category)
  end
  
  def find_snippet
    @snippet = Snippet.find(params[:id])
  end
end
