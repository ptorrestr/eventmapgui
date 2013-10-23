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

ActiveRecord::Schema.define(version: 20131022110807) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.integer  "alert"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["name"], name: "index_events_on_name", unique: true

  create_table "tweets", force: true do |t|
    t.integer  "twitter_id"
    t.string   "twitter_text"
    t.integer  "twitter_user_id"
    t.string   "twitter_screen_name"
    t.string   "twitter_profile_image_url"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["created_at"], name: "index_tweets_on_created_at"
  add_index "tweets", ["event_id"], name: "index_tweets_on_event_id"

end
