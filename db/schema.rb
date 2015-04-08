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

ActiveRecord::Schema.define(version: 20150408055753) do

  create_table "disease_categories", force: :cascade do |t|
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
    t.integer  "common",         limit: 4
    t.integer  "viewed",         limit: 4
  end

  create_table "diseases", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "summary",    limit: 65535
    t.text     "overview",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
