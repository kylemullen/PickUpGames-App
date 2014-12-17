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

ActiveRecord::Schema.define(version: 20141217012548) do

  create_table "courts", force: true do |t|
    t.string   "name"
    t.integer  "sport_id"
    t.integer  "park_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gamed_players", force: true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "players_bringing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "title"
    t.integer  "court_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status",              default: "open"
    t.integer  "players_looking_for"
    t.integer  "players_committed"
    t.string   "skill_level"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parks", force: true do |t|
    t.string   "name"
    t.integer  "neighborhood_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "park_number"
    t.string   "street_address"
    t.string   "zip"
    t.decimal  "acres",           precision: 9, scale: 2
    t.integer  "ward"
    t.string   "park_class"
    t.string   "lat"
    t.string   "lng"
  end

  create_table "sports", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "players"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
