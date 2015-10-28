class Post < ActiveRecord::Base
  
	before_validation :create_slug
	
  has_attached_file :image, styles: { medium: "300x300>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :title
  validates :category, presence: true
	validates_presence_of :slug
	
	def to_param
		slug
	end
	
	def create_slug
		self.slug = self.title.parameterize
	end
	
end
