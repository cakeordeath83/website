class DeleteProjectAttributeFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :project
  end
end
