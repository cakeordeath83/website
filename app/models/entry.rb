class Entry < ActiveRecord::Base
 
 
  
  before_validation :create_slug  
  
  def to_param
		slug
	end
  
  def create_slug
    if self.title =~ /^[!?.%&:;]/
      self.slug = "character"
    else
		  self.slug = self.title.parameterize
    end
	end
  
  
  
end
