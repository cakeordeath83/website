class DeleteCategoryFromSnippets < ActiveRecord::Migration
  def up
		remove_column :snippets, :category
	end
	
	def down
		add_column :snippets, :category, :string
	end
end
