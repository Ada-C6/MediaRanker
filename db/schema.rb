ActiveRecord::Schema.define(version: 20161011181547) do

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "director"
    t.string   "description"
    t.integer  "ranking"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
