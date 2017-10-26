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

ActiveRecord::Schema.define(version: 20171025212900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "concert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_attends_on_concert_id", using: :btree
    t.index ["user_id"], name: "index_attends_on_user_id", using: :btree
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.json     "similar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mb_id"
    t.string   "tag"
  end

  create_table "concerts", force: :cascade do |t|
    t.date     "date"
    t.string   "venue"
    t.string   "city"
    t.string   "state"
    t.json     "setlist"
    t.integer  "band_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_concerts_on_band_id", using: :btree
    t.index ["user_id"], name: "index_concerts_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "city"
    t.string   "state"
  end

  create_table "wishes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_wishes_on_band_id", using: :btree
    t.index ["user_id"], name: "index_wishes_on_user_id", using: :btree
  end

  add_foreign_key "attends", "concerts"
  add_foreign_key "attends", "users"
  add_foreign_key "concerts", "bands"
  add_foreign_key "concerts", "users"
  add_foreign_key "wishes", "bands"
  add_foreign_key "wishes", "users"
end
