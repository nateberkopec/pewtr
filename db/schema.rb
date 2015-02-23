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

ActiveRecord::Schema.define(version: 20150223130509) do

  create_table "owned_games", force: :cascade do |t|
    t.integer  "steam_profile_id"
    t.integer  "appid"
    t.integer  "playtime_forever"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "owned_games", ["steam_profile_id"], name: "index_owned_games_on_steam_profile_id"

  create_table "steam_apps", force: :cascade do |t|
    t.integer  "appid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "steam_apps", ["appid"], name: "index_steam_apps_on_appid"

  create_table "steam_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "steamid"
    t.string   "personaname"
    t.string   "profileurl"
    t.string   "avatar"
    t.string   "avatarmedium"
    t.string   "avatarfull"
    t.datetime "lastlogoff"
    t.string   "steam_level"
    t.datetime "timecreated"
    t.string   "loccountrycode"
    t.string   "locstatecode"
    t.string   "loccityid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "steam_profiles", ["user_id"], name: "index_steam_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "steam_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "has_mac",     default: false
    t.boolean  "has_windows", default: false
    t.boolean  "has_linux",   default: false
    t.integer  "system_spec", default: 1
  end

  add_index "users", ["steam_id"], name: "index_users_on_steam_id"

end
