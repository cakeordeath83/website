class AddAttributesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :duration, :integer
    add_column :posts, :api_id, :integer
    add_column :posts, :pif, :integer
    rename_column :posts, :start_time, :start
    rename_column :posts, :end_time, :stop
    remove_column :posts, :notes
    remove_column :posts, :important
  end
end
 
