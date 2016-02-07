module TimeEntriesHelper
  
  def grouped_timeentries
    @time_entries.group_by{|entry| entry.start.to_date}
	end
  
  def live_post
    TimeEntry.all.last.stop.nil? ? time_entries.last : nil
	end
  
end
