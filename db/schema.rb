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

ActiveRecord::Schema.define(version: 20140616140332) do

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.datetime "play_time"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["group_id"], name: "index_matches_on_group_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "win"
    t.integer  "draw"
    t.integer  "loss"
    t.integer  "gf"
    t.integer  "ga"
    t.integer  "points"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["group_id"], name: "index_teams_on_group_id"

end
