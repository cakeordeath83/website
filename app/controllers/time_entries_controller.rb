class TimeEntriesController < ApplicationController
  
  def index
    @time_entries = TimeEntry.all
  end
  
end
