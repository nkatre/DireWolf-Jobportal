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

ActiveRecord::Schema.define(version: 20140927191704) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", force: true do |t|
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "email"
    t.string   "password"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobapplications", force: true do |t|
    t.integer  "job_id"
    t.integer  "jobseeker_id"
    t.text     "coverletter"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "job_id"
    t.string   "title"
    t.text     "description"
    t.string   "tag1"
    t.string   "tag2"
    t.string   "tag3"
    t.string   "category"
    t.date     "deadline"
    t.integer  "employer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobseekers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "skills"
    t.text     "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
