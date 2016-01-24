class CreateTopictags < ActiveRecord::Migration
  def change
    create_table :topictags do |t|
			t.references :topic, index: true, foreign_key: true
			t.references :entry, index: true, foreign_key: true
			
      t.timestamps null: false
    end
  end
end
