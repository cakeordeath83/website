class SnippetsController < ApplicationController
  
  before_action :find_snippet, only: [:show, :update, :edit, :destroy]
	before_action :allsnippets
  add_breadcrumb "GUIDES", :snippets_path
  
  def index
    if params[:category]
      add_breadcrumb "#{params[:category].upcase}", :snippets_path
      @snippets = Snippet.where(:category => params[:category]).paginate(page: params[:page], :per_page => 6)   
    
    else
      @snippets = Snippet.all.paginate(page: params[:page], :per_page => 6)
    end
    @allsnippets = Snippet.all 
 end
  
  def new
    
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
	
	def allsnippets
		@allsnippets = Snippet.all
	end
  
  def snippet_params
    params.require(:snippet).permit(:title, :content, :category)
  end
  
  def find_snippet
    @snippet = Snippet.find(params[:id])
  end
end
