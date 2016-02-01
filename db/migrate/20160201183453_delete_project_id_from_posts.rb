class DeleteProjectIdFromPosts < ActiveRecord::Migration
  def change
		remove_column :posts, :project_id
  end
end
