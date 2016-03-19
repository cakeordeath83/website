class Entry < ActiveRecord::Base
 
 before_validation :create_slug  
	
	has_many :topictags
	has_many :topics, through: :topictags, :dependent => :destroy
	accepts_nested_attributes_for :topics
	
  validates :title, presence: true
	validates_presence_of :topics
  
  def to_param
		slug
	end
  
  def create_slug
   # if self.title =~ /^[!?.%&:;]/
    #  self.slug = "character"
   # else
		  self.slug = self.title.parameterize
   # end
	end
	
	def topic_list
		self.topics.collect do |topic|
			topic.name
		end.join(", ")
	end
	
	def topic_list=(topics_string)
		# Split the string wherever there is a comma, remove whitespace and capitalise each of them and only add them to tag_names if they are unique
		topic_names = topics_string.split(",").collect{|s| s.strip.downcase.capitalize}.uniq
		# Go through each tag_name and find or create a tag with that name and store in new_or_found_tags variable
		new_or_found_topics = topic_names.collect{|name| Topic.find_or_create_by(name: name)}
		# Assign them to the snippet
		self.topics = new_or_found_topics
	end
  
  
  
end
