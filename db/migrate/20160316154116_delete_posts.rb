class DeletePosts < ActiveRecord::Migration
  def change
    drop_table "posts", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.datetime "start"
    t.datetime "stop"
    t.integer  "duration"
    t.integer  "api_id"
    t.integer  "pif"
  end
  end
end
