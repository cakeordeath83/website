class Topictag < ActiveRecord::Base
	belongs_to :topic
	belongs_to :entry
end
