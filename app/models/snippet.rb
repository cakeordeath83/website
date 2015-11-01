class Snippet < ActiveRecord::Base
	
  before_validation :create_slug
	
	has_many :taggings
	has_many :tags, through: :taggings, :dependent => :destroy
	accepts_nested_attributes_for :tags
	
  validates :title, presence: true
	validates_presence_of :tags
  
	def to_param
		slug
	end
	
	def create_slug
		self.slug = self.title.parameterize + "-in-rails"
	end
	
	
	
	# Collect each of the entries in the 'tag' input box, take their name and then join them where there is a comma?
	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end
	
	def tag_list=(tags_string)
		# Split the string wherever there is a comma, remove whitespace and capitalise each of them and only add them to tag_names if they are unique
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase.capitalize}.uniq
		# Go through each tag_name and find or create a tag with that name and store in new_or_found_tags variable
		new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name)}
		# Assign them to the snippet
		self.tags = new_or_found_tags
	end

end
