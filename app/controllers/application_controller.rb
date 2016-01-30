class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
  helper_method :live_post
  
  #def live_post
   # Post.find{|post| post.start_time < DateTime.now && post.end_time > DateTime.now}
  #end

	# No access to @body variable
	def live_post
		week_ago = Date.today - 7
		 now = "#{Date.today.iso8601}T#{Time.now.strftime("%H")}%3A#{Time.now.strftime("%M")}%3A#{Time.now.strftime("%S")}%2B00%3A00"
     last_week = "#{week_ago.iso8601}T00%3A00%3A00%2B00%3A00"
		 
		 @url = "https://toggl.com/api/v8/time_entries?start_date=#{last_week}&end_date=#{now}"
		 request = HTTParty.get(@url, {basic_auth: {username: 'f89f3fac7a437c624ec0964143b62c02', password: 'api_token'}})
		 @body = JSON.parse(request.body)
		
		
		
		
		if @body.last["stop"] == nil
			@body.last
		else
			nil
		end
	end
	
end
