class Post < ActiveRecord::Base
 
  def total_hours
    (self.end_time - self.start_time) / 3600
  end
  
  def total_minutes
    ((self.end_time - self.start_time) % 3600) / 60
  end
  
  def self.total_time(date)
    posts = self.select{|post| post.start_time.strftime("%D") == date.strftime("%D")}
    arr = []
    posts.each do |post|
      arr.push(post.end_time - post.start_time)
    end
    return arr.reduce(:+) / 3600
  end
  
end
