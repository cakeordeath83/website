class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
  helper_method :live_post
  
  def live_post
    Post.find{|post| post.start_time < DateTime.now && post.end_time > DateTime.now}
  end
	
end
