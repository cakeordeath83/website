class PostsController < ApplicationController
  
  # Probably need to get rid of!
=begin
	add_breadcrumb "ALL ACTIVITIES", :posts_path
  
  def index
  #week_ago = Date.today - 7
  #now = "#{Date.today.iso8601}T#{Time.now.strftime("%H")}%3A#{Time.now.strftime("%M")}%3A#{Time.now.strftime("%S")}%2B00%3A00"
  #last_week = "#{week_ago.iso8601}T00%3A00%3A00%2B00%3A00"
  #api = ENV["TOGGL_API_USERNAME"]
  #@url = "https://toggl.com/api/v8/time_entries?start_date=#{last_week}&end_date=#{now}"
  #request = HTTParty.get(@url, {basic_auth: {username: "#{api}", password: 'api_token'}})
  #@body = JSON.parse(request.body) 
    @time_entries = TimeEntry.all
  end
  
  def new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

private
    
    def post_params
      params.require(:post).permit(:description)
    end
=end    
    
end
