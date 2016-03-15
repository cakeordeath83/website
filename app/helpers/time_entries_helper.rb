module TimeEntriesHelper
  
  def grouped_time_entries
    TimeEntry.all.group_by{|entry| entry.start.to_date}
	end
  
  def today_grouped_time_entries
    @today_time_entries.group_by{|entry| entry["start"].to_date}
  end
  
  def live_post
    @today_time_entries.last["stop"].nil? ? @today_time_entries.last : nil
  end
    
  
end
