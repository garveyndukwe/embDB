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

ActiveRecord::Schema.define(version: 20150913072140) do

  create_table "forests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "plantation",  default: true
    t.string   "specie"
    t.date     "established"
    t.date     "enumerated"
    t.string   "location",                   null: false
    t.string   "gps"
    t.float    "area"
    t.string   "comment"
    t.integer  "project_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "forests", ["project_id"], name: "index_forests_on_project_id"

  create_table "generes", force: :cascade do |t|
    t.string   "code"
    t.string   "botanical_name"
    t.string   "common_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.string   "tree_code"
    t.decimal  "girth"
    t.decimal  "height"
    t.integer  "year_taken"
    t.integer  "tree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "measurements", ["tree_id"], name: "index_measurements_on_tree_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string   "code"
    t.integer  "number"
    t.integer  "specie"
    t.integer  "status"
    t.string   "comment"
    t.integer  "forest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trees", ["forest_id"], name: "index_trees_on_forest_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
