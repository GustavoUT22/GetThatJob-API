# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_19_004906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "professional_id", null: false
    t.bigint "job_id", null: false
    t.text "experience"
    t.text "why_interested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["professional_id"], name: "index_applications_on_professional_id"
  end

  create_table "follows", force: :cascade do |t|
    t.boolean "following"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "type"
    t.integer "salary"
    t.text "mandatory"
    t.text "optional"
    t.text "about"
    t.integer "application_count"
    t.bigint "recruiter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruiter_id"], name: "index_jobs_on_recruiter_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.date "birth_date"
    t.string "linkedin"
    t.integer "phone"
    t.string "password"
    t.string "professional_title"
    t.text "experience"
    t.text "education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email"
    t.string "company_name"
    t.string "company_website"
    t.text "company_about"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "professionals"
  add_foreign_key "jobs", "recruiters"
end
