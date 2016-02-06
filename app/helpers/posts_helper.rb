module PostsHelper
	
	def grouped_timeentries
		Post.all.group_by{|entry| entry.start.to_date}
	end
	
	
	
	def live_post(time_entries)
		time_entries.last.stop.nil? ? time_entries.last : nil
	end
end
