class PostsController < ApplicationController
	
	
	
  before_action :find_post, only: [:show, :edit, :update, :delete]
  before_action :allposts
  add_breadcrumb "ALL POSTS", :posts_path
  
	
  
  def index
    @posts = Post.all
    @live_post = @posts.find{|post| post.start_time < DateTime.now && post.end_time > DateTime.now}
    
 end
  
  def new
     @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:error]="Post was not saved"
      render :new
    end
  end
  
  def edit
    @posts = Post.all
  end
  
  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      flash[:error]="Post was not saved"
      render :edit
    end
  end
  
  def show
    add_breadcrumb "#{@post.title.upcase}", post_path(@post)
  end
  
	
	
	

  
private
  
  def allposts
    @allposts = Post.all
  end
  
  def post_params
    params.require(:post).permit(:project, :description, :start_time, :end_time, :notes, :important)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end
