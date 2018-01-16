class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :snippets, through: :taggings, dependent: :destroy
end
