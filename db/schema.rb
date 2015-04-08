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

ActiveRecord::Schema.define(version: 20150404210426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "sn",         null: false
    t.string   "uid"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["sn", "uid"], name: "index_authentications_on_sn_and_uid", unique: true, using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "links"
    t.string   "logo"
    t.string   "hashtag"
    t.text     "tags",        default: [],              array: true
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "community_id"
    t.integer  "location"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "logo"
    t.text     "tags",         default: [],              array: true
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.text     "links"
    t.string   "email"
    t.string   "login"
    t.text     "password"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "skills",                 default: [],              array: true
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "locked_at"
  end

  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true, using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["unconfirmed_email"], name: "index_members_on_unconfirmed_email", unique: true, using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "address"
    t.text     "description"
    t.text     "photos"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name"
    t.string   "link"
    t.text     "contacts"
    t.text     "interests",   default: [],              array: true
  end

end
