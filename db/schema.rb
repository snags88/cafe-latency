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

ActiveRecord::Schema.define(version: 20150726193803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "url"
    t.float    "rating"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "state_code"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "neighborhoods", default: [],              array: true
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "store_id"
    t.float    "download"
    t.float    "upload"
    t.float    "latency"
    t.float    "jitter"
    t.string   "test_server"
    t.string   "ip_address"
    t.string   "host_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tests", ["store_id"], name: "index_tests_on_store_id", using: :btree

  add_foreign_key "tests", "stores"
end
