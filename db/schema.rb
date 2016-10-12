# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161012204918) do

  create_table "bob_votes", force: :cascade do |t|
    t.integer  "bob_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bobs", force: :cascade do |t|
    t.string   "name"
    t.string   "appears_in"
    t.string   "identifying_quality"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "leslie_nielsons", force: :cascade do |t|
    t.string   "title"
    t.string   "part"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leslie_votes", force: :cascade do |t|
    t.integer  "leslie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wizard_votes", force: :cascade do |t|
    t.integer  "wizard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wizards", force: :cascade do |t|
    t.string   "title"
    t.string   "author_director"
    t.string   "main_character"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
