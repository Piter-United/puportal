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

ActiveRecord::Schema.define(version: 20151029212717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "provider",   null: false
    t.string   "uid"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", unique: true, using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "hashtag"
    t.text     "tags",        default: [],              array: true
    t.string   "short_name"
    t.string   "elem"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "community_id"
    t.integer  "address"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "logo"
    t.text     "tags",         default: [],              array: true
    t.float    "latitude"
    t.float    "longitude"
    t.json     "location",     default: {}
    t.datetime "start"
    t.datetime "finish"
  end

  create_table "members", force: :cascade do |t|
    t.integer "community_id"
    t.integer "user_id"
  end

  add_index "members", ["community_id", "user_id"], name: "index_members_on_community_id_and_user_id", unique: true, using: :btree

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

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unconfirmed_email"], name: "index_users_on_unconfirmed_email", unique: true, using: :btree

end
