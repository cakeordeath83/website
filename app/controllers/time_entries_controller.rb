require 'toggl_api'

class TimeEntriesController < ApplicationController
  def index
    @time_entries = TimeEntry.where("start >= ?", 1.week.ago )
    to = Time.zone.now
    from = Time.zone.now.beginning_of_day
    @today_time_entries = TogglApi.get_time_entries(from: from, to: to)
  end

  def dashboard
    from = params[:from].present? ? params[:from] : "2015-07-08"
    to = "2016-05-07" || params[:to]
    @time_entries = TogglApi.get_dashboard_info(from: from, to: to)
  end
end
