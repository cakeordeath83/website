module PostsHelper
	
	def grouped_posts
		@posts.group_by{|post| post.start_time.to_date}
	end
end
