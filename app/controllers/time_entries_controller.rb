class TimeEntriesController < ApplicationController
  
  def index
    @time_entries = TimeEntry.all
    day_ago = Date.today - 1
    now = "#{Date.today.iso8601}T#{Time.now.strftime("%H")}%3A#{Time.now.strftime("%M")}%3A#{Time.now.strftime("%S")}%2B00%3A00"
    last_week = "#{day_ago.iso8601}T00%3A00%3A00%2B00%3A00"
    api = ENV["TOGGL_API_USERNAME"]
    @url = "https://toggl.com/api/v8/time_entries?start_date=#{last_week}&end_date=#{now}"
    request = HTTParty.get(@url, {basic_auth: {username: "#{api}", password: 'api_token'}})

    @new_time_entries = JSON.parse(request.body)
     
  end
  
end
