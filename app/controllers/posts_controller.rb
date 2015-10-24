class PostsController < ApplicationController
  
  before_action :find_post, only: [:show, :edit, :update, :delete]
  before_action :allposts
  add_breadcrumb "ALL POSTS", :posts_path
  
  
  def index
    if params[:category]
      add_breadcrumb "#{params[:category].upcase}"
      @posts = Post.where(:category => params[:category]).order(created_at: :desc).paginate(page: params[:page], :per_page => 3) 
    elsif params[:month]
      add_breadcrumb "#{params[:month].upcase}"
      @posts = Post.where("trim(to_char(created_at, 'month')) = ?", params[:month].downcase).order(created_at: :desc).paginate(page: params[:page], :per_page => 3)
    else
      @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], :per_page => 5)
    end
      
 end
  
  def new
    
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
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
      redirect_to post_path(@post)
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
    params.require(:post).permit(:title, :content, :category, :image, :created_at)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end
