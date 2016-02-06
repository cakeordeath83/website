module PostsHelper
	
	def grouped_timeentries
		@body.group_by{|entry| entry["start"].to_date}
	end
	
	def find_project(pid)
		@projecturl = "https://www.toggl.com/api/v8/projects/#{pid}"
		request = HTTParty.get(@projecturl, {basic_auth: {username: 'f89f3fac7a437c624ec0964143b62c02', password: 'api_token'}})
		@projectbody = JSON.parse(request.body)
		@projectbody["data"]["name"]
	end
	
	def live_post(time_entries)
		time_entries.last["stop"].nil? ? time_entries.last : nil
	end
end
