class AddSlugtoProductsandSnippets < ActiveRecord::Migration

  def change
		add_column :posts, :slug, :string
		add_column :snippets, :slug, :string
  end
end
