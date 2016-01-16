class Post < ActiveRecord::Base
  
  belongs_to :project
  #Something to do with all of this.... but not quite working
 # def start_time_date
  #  self.start_time.to_date
 # end
  
 # scope :posts_on_date, -> (date) {where(:start_time_date => date) }
  
  def total_hours(date)
    posts = self.select{|post| post.start_time.to_date == date}
    (self.end_time - self.start_time) / 3600
  end
  
  def total_minutes
    ((self.end_time - self.start_time) / 60).floor
  end
  
  def total_seconds
    (self.end_time - self.start_time)
  end

  def self.total_time(date)
    post = self.select{|post| post.start_time.to_date == date}
    arr = []
    post.each do |post|
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
