require 'toggl_api'

class TimeEntriesController < ApplicationController
  def index
    @time_entries = TimeEntry.all
    to = Time.zone.now
    from = Time.zone.now.beginning_of_day
    @today_time_entries = TogglApi.get_time_entries(from: from, to: to)
  end

  def dashboard
    from = 1.day.ago.strftime("%Y-%m-%d")
    to = Time.now.strftime("%Y-%m-%d")
    @time_entries = TogglApi.get_dashboard_info(from: from, to: to)
  end
end
