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

ActiveRecord::Schema.define(version: 20190515182815) do

  create_table "chats", force: :cascade do |t|
    t.string "title"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "address"
    t.string "education"
    t.string "career_level"
    t.string "type"
    t.string "branch"
    t.string "password_digest"
  end

  create_table "employers", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "location"
    t.string "founded"
    t.integer "number_of_employees"
    t.string "description"
    t.string "type"
    t.string "branch"
    t.string "password_digest"
  end

  create_table "job_employees", force: :cascade do |t|
    t.integer "job_id"
    t.integer "employee_id"
    t.boolean "approved", default: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "contract_type"
    t.boolean "vacant"
    t.datetime "created_at"
    t.integer "employer_id"
    t.string "location"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at"
  end

  create_table "saveds", force: :cascade do |t|
    t.integer "job_id"
    t.integer "employee_id"
  end

end
