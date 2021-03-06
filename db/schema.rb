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

ActiveRecord::Schema.define(version: 20150805231200) do

  create_table "demonstrations", force: :cascade do |t|
    t.string   "description"
    t.boolean  "core",          default: false
    t.string   "subset"
    t.string   "display"
    t.string   "category"
    t.string   "cert"
    t.integer  "experience_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "displays", force: :cascade do |t|
    t.string   "category"
    t.integer  "placement"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.string   "route"
    t.string   "header_font"
    t.string   "prose_font"
    t.boolean  "pdf",         default: false
    t.boolean  "docx",        default: false
    t.boolean  "txt",         default: false
    t.integer  "resume_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "organization"
    t.string   "start_month"
    t.integer  "start_year"
    t.string   "end_month"
    t.integer  "end_year"
    t.string   "category"
    t.string   "city"
    t.string   "state_or_country"
    t.boolean  "present",          default: false
    t.integer  "resume_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "resume_name"
    t.string   "email"
    t.string   "phone"
    t.string   "profile"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "txt_file_name"
    t.string   "txt_content_type"
    t.integer  "txt_file_size"
    t.datetime "txt_updated_at"
    t.string   "docx_file_name"
    t.string   "docx_content_type"
    t.integer  "docx_file_size"
    t.datetime "docx_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
