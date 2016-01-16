class AddProjectToPosts < ActiveRecord::Migration
  def change
   
   
    add_reference :posts, :project, index: true
    add_foreign_key :posts, :projects
  
  
  end
end
