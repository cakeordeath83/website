class PostsController < ApplicationController
	
	
	
  before_action :find_post, only: [:show, :edit, :update, :delete]
  before_action :allposts
  before_action :project_options, only: [:new, :edit, :update, :create]
  add_breadcrumb "ALL ACTIVITIES", :posts_path
  
	
  
   def index
    @posts = Post.all
		@url = "https://toggl.com/api/v8/time_entries?start_date=2016-01-26T15%3A42%3A46%2B02%3A00&end_date=2016-01-27T15%3A42%3A46%2B02%3A00"

		request = HTTParty.get(@url, {basic_auth: {username: 'f89f3fac7a437c624ec0964143b62c02', password: 'api_token'}})
		
		@body = JSON.parse(request.body)
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
    params.require(:post).permit(:project, :description, :start_time, :end_time, :notes, :important, :project_id)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
  def project_options
    @project_options = Project.all.map{|p| [p.title, p.id]}
    end
  
end
