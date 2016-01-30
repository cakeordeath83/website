module PostsHelper
	
	def grouped_timeentries
		@body.group_by{|entry| entry["start"].to_date}
	end
end
