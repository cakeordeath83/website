class PostsController < ApplicationController
  
  before_action :find_post, only: [:show, :edit, :update, :delete]
  add_breadcrumb "ALL POSTS", :posts_path
  
  
  def index
    @posts = Post.all
  end
  
  def new
    @posts = Post.all
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  
  def edit
    @posts = Post.all
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def show
    add_breadcrumb "#{@post.title.upcase}", post_path(@post)
  end
  

  
private
  
  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end
