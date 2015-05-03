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

ActiveRecord::Schema.define(version: 20150502111729) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.integer  "parent_id",      limit: 4
    t.integer  "depth",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "icd",            limit: 255
    t.string   "name_en",        limit: 255
    t.string   "en_acronym",     limit: 255
    t.string   "name_py",        limit: 255
    t.string   "py_acronym",     limit: 255
    t.integer  "lft",            limit: 4
    t.integer  "rgt",            limit: 4
    t.integer  "children_count", limit: 4
    t.integer  "viewed",         limit: 4
    t.boolean  "common",         limit: 1
  end

  create_table "categories_departments", id: false, force: :cascade do |t|
    t.integer "department_id", limit: 4, null: false
    t.integer "category_id",   limit: 4, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "summary",     limit: 65535
    t.text     "overview",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name_en",     limit: 255
    t.string   "en_acronym",  limit: 255
    t.string   "name_py",     limit: 255
    t.string   "py_acronym",  limit: 255
    t.text     "image",       limit: 65535
    t.string   "alt_name",    limit: 255
    t.string   "cause",       limit: 255
    t.integer  "category_id", limit: 4
  end

  add_index "diseases", ["category_id"], name: "index_diseases_on_category_id", using: :btree

  create_table "treatments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        limit: 255, null: false
    t.string   "crypted_password",             limit: 255
    t.string   "salt",                         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id",                limit: 4
    t.string   "remember_me_token",            limit: 255
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state",             limit: 255
    t.string   "activation_token",             limit: 255
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
