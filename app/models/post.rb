class Post < ActiveRecord::Base
 
  def total_hours
    (self.end_time - self.start_time) / 3600
  end
  
  def total_minutes
    (self.end_time - self.start_time) / 60
  end
  
  def total_seconds
    (self.end_time - self.start_time)
  end

  
  def self.total_time(date)
    posts = self.select{|post| post.start_time.to_date == date}
    arr = []
    posts.each do |post|
      arr.push(post.total_seconds)
    end
    return arr.reduce(:+) 
  end
  
  def self.projects
    projects = []
    self.each do |p|
      projects.push(p.project)
    end
    projects
  end
  
end
