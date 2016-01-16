class AddEntriesToProjects < ActiveRecord::Migration
  def change
   
    add_reference :entries, :project, index: true
    add_foreign_key :entries, :projects
  
  end
end
