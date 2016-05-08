class Topic < ActiveRecord::Base
  has_many :topictags
  has_many :entries, through: :topictags, dependent: :destroy
end
