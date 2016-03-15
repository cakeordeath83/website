require 'toggl_api'

desc "This task retreives the last 24 hours time entries"
# TASK TAKES A HASH K = name of task value = depndency
task get_toggl_time_entries: :environment do
  puts "Calling API..."
  to = Date.yesterday.end_of_day
  from = Date.yesterday.beginning_of_day
  time_entries = TogglApi.get_time_entries(from: from, to: to)
  time_entries.each do |te|
    TimeEntry.create!(
      description: te["description"],
      start: te["start"], 
      stop: te["stop"], 
      duration: te["duration"], 
      toggl_id: te["id"])
  end
  puts "done."
end

