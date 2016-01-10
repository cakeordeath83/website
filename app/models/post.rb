class Post < ActiveRecord::Base
 
  def date
    start_time.to_date
  end
  
  
end
