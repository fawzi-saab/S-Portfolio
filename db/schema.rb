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

ActiveRecord::Schema.define(version: 20220303140623) do

  create_table "certificates", force: :cascade do |t|
    t.string   "title"
    t.string   "institute"
    t.integer  "profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.bigint   "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["profile_id"], name: "index_certificates_on_profile_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "title"
    t.string   "institute"
    t.integer  "year_of_graduation"
    t.integer  "profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["profile_id"], name: "index_educations_on_profile_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "company_name"
    t.string   "position_title"
    t.integer  "start_month"
    t.integer  "start_year"
    t.integer  "end_month"
    t.integer  "end_year"
    t.text     "tasks_description"
    t.integer  "profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_email"
    t.string   "country"
    t.string   "city"
    t.string   "phone_number"
    t.string   "fb_link"
    t.string   "lkd_link"
    t.string   "github_link"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "profession"
    t.text     "background_overview"
    t.integer  "years_of_experience"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.bigint   "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "project_description"
    t.string   "project_link"
    t.integer  "profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.bigint   "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["profile_id"], name: "index_projects_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
