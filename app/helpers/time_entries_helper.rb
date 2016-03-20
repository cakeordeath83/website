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
  
  def total_time_this_week
     time_today.to_i + time_this_week.to_i
  end
  
  def time_today
    today = @today_time_entries.map{|entry| entry["duration"]}
    if today.last < 0
      today[0..-2].reduce(:+)
    else
      today.reduce(:+)
    end
  end
  
  def time_this_week
    Date.beginning_of_week = :saturday
    this_week = @time_entries.select{|entry| entry.start > Date.today.beginning_of_week}
    this_week.map{|entry| entry.duration}.reduce(:+)
  end
  
  def hours_and_minutes(seconds)
    hours = (seconds / 3600).round
    minutes = ((seconds % 3600)/60).round
    "#{hours} hours and #{minutes} minutes"
  end
  
  def time_left_today
    21600 - time_today.to_i
  end
  
  def time_left_this_week
    129_600 - time_this_week.to_i
  end
  
end
