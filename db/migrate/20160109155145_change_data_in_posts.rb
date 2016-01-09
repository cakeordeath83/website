class ChangeDataInPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :title
    remove_column :posts, :content
    remove_column :posts, :category
    remove_column :posts, :image_file_name
    remove_column :posts, :image_content_type
    remove_column :posts, :image_updated_at
    remove_column :posts, :image_file_size
    remove_column :posts, :slug
    add_column :posts, :project, :string
    add_column :posts, :description, :string
    add_column :posts, :start_time, :datetime
    add_column :posts, :end_time, :datetime
    add_column :posts, :notes, :text
    add_column :posts, :important, :string
  end

  def self.down
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :category, :string
    add_column :posts, :image_file_name, :string
    add_column :posts, :image_content_type, :string
    add_column :posts, :image_file_size, :integer
    add_column :posts, :image_updated_at, :datetime
    add_column :posts, :slug, :string
  end
end
