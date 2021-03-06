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

ActiveRecord::Schema.define(version: 20140706140820) do

  create_table "events", force: true do |t|
    t.string   "event_type"
    t.string   "player"
    t.string   "minute"
    t.integer  "match_id"
    t.boolean  "home_team"
    t.boolean  "away_team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["match_id"], name: "index_events_on_match_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.datetime "play_time"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.string   "match_type"
    t.string   "extra_time"
  end

  add_index "matches", ["group_id"], name: "index_matches_on_group_id"

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "matches"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

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
    t.string   "flag"
  end

  add_index "teams", ["group_id"], name: "index_teams_on_group_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
