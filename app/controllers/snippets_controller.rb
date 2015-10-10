class SnippetsController < ApplicationController
  
  before_action :find_snippet, only: [:show, :update, :edit, :destroy]
  
  def index
    @snippets = Snippet.all
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
  
  private
  
  def snippet_params
    params.require(:snippet).permit(:title, :content)
  end
  
  def find_snippet
    @snippet = Snippet.find(params[:id])
  end
end
