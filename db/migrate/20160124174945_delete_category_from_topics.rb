class DeleteCategoryFromTopics < ActiveRecord::Migration
  def change
		remove_column :topics, :category
		remove_column :entries, :project_id
  end
end
