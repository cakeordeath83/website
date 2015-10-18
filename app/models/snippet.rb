class Snippet < ActiveRecord::Base
  
  validates :title, presence: true
  validates :category, presence: true

end
