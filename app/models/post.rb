class Post
	attr_accessor :params
	
	def self.all
		# call api
		 week_ago = Date.today - 7
		 now = "#{Date.today.iso8601}T#{Time.now.strftime("%H")}%3A#{Time.now.strftime("%M")}%3A#{Time.now.strftime("%S")}%2B00%3A00"
     last_week = "#{week_ago.iso8601}T00%3A00%3A00%2B00%3A00"
		 @url = "https://toggl.com/api/v8/time_entries?start_date=#{last_week}&end_date=#{now}"
		 request = HTTParty.get(@url, {basic_auth: {username: "f89f3fac7a437c624ec0964143b62c02", password: 'api_token'}})
		 @body = JSON.parse(request.body)
# Since it isn't going into the database, it doesn't need to touch the contoller
# .each would work but more code than needed
# a method returns the LAST thing - in the case below it is @body so we don't need to return it at the end
# new method comes from initialize below
# Ruby evaluates the WHOLE file before it runs so it doesn't matter that the initialize method is after this one
# Can pick out individual elements if needed (description: entry["description"], but if you want everything then just add entry

			@body.map do |entry|
				Post.new(entry)
			end
  end
	
	def initialize(params)
		self.params = params
	end

  def stop
		params["stop"]
	end
	
	def finished?
		params['stop'].nil?
	end
end