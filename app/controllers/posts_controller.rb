class PostsController < ApplicationController
  
  before_action :find_post, only: [:show, :edit, :update, :delete]
  add_breadcrumb "Posts", :posts_path
  
  
  def index
    @posts = Post.all
    add_breadcrumb "index", posts_path
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def show
    add_breadcrumb "Post name here", post_path(@post)
  end
  
private
  
  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end
