class PostsController < ApplicationController
	
	
	
  before_action :find_post, only: [:show, :edit, :update, :delete]
  before_action :allposts
  before_action :project_options, only: [:new, :edit, :update, :create]
  add_breadcrumb "ALL ACTIVITIES", :posts_path
  
	 
   def index
		 week_ago = Date.today - 7
		 now = "#{Date.today.iso8601}T#{Time.now.strftime("%H")}%3A#{Time.now.strftime("%M")}%3A#{Time.now.strftime("%S")}%2B00%3A00"
     last_week = "#{week_ago.iso8601}T00%3A00%3A00%2B00%3A00"
		 
		 @url = "https://toggl.com/api/v8/time_entries?start_date=#{last_week}&end_date=#{now}"
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
