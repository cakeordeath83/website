require 'toggl_api'
class PagesController < ApplicationController
	
	def welcome
    to = Time.zone.now
    from = Time.zone.now.beginning_of_day
    @today_time_entries = TogglApi.get_time_entries(from: from, to: to)
  end
  
  def portfolio
  end
  
end
