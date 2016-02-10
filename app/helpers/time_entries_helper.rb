module TimeEntriesHelper
  
  def grouped_time_entries
    @time_entries.group_by{|entry| entry.start.to_date}
	end
  
  def today_grouped_time_entries
    @today_time_entries.group_by{|entry| entry["start"].to_date}
  end
  
  def live_post
    TimeEntry.all.last.stop.nil? ? time_entries.last : nil
	end
  
end
