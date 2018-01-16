class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.string :description
      t.datetime :start
      t.datetime :stop
      t.integer :duration
      t.integer :toggl_id
      t.integer :pid
      t.timestamps null: false
    end
  end
end
