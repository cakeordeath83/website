class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :link
      t.attachment :image
      t.timestamps null: false
    end
  end
end
