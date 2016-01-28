module PostsHelper
	
	def grouped_posts
		@posts.group_by{|post| post.start_time.to_date}
	end
	
	def grouped_timeentries
		@body.group_by{|entry| entry["start"].to_date}
	end
end
