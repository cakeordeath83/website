class TimeEntry < ActiveRecord::Base
  validates_uniqueness_of :toggl_id
end
