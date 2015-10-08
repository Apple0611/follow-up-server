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

ActiveRecord::Schema.define(version: 20151008094317) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "name_py"
    t.string   "py_abbr"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "parent_id"
    t.integer  "depth"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "children_count"
    t.string   "type"
    t.integer  "category_id"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id"

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "overview"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name_en"
    t.string   "en_abbr"
    t.string   "name_py"
    t.string   "py_abbr"
    t.text     "image"
    t.string   "alt_name"
    t.string   "cause"
    t.integer  "department_id"
  end

  add_index "diseases", ["department_id"], name: "index_diseases_on_department_id"

  create_table "identities", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "disease_id"
    t.string   "name"
    t.text     "description"
  end

  add_index "treatments", ["disease_id"], name: "index_treatments_on_disease_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 48,  default: ""
    t.string   "mobile",                 limit: 16,  default: ""
    t.string   "email",                  limit: 128, default: ""
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "password_salt",          limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

end
