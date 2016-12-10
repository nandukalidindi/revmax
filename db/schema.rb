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

ActiveRecord::Schema.define(version: 20161209233501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connected_apps", force: :cascade do |t|
    t.string   "name"
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
    t.jsonb    "place"
    t.datetime "start_time"
    t.string   "handle"
    t.string   "fid"
    t.integer  "attending_count"
    t.boolean  "can_guests_invite"
    t.string   "category"
    t.jsonb    "cover"
    t.integer  "declined_count"
    t.boolean  "guest_list_enabled"
    t.integer  "interested_count"
    t.boolean  "is_canceled"
    t.boolean  "is_page_owned"
    t.boolean  "is_viewer_admin"
    t.integer  "maybe_count"
    t.integer  "noreply_count"
    t.string   "parent_group"
    t.jsonb    "owner"
    t.string   "ticket_uri"
    t.string   "timezone"
    t.datetime "end_time"
    t.datetime "updated_time"
    t.string   "type"
  end

end
