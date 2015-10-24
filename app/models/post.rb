class Post < ActiveRecord::Base
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :title
  validates :category, presence: true
end
