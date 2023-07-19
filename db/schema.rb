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

ActiveRecord::Schema[7.0].define(version: 2023_07_19_170208) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "professional_id", null: false
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable"
    t.index ["professional_id"], name: "index_follows_on_professional_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "job_type"
    t.integer "salary"
    t.text "mandatory"
    t.text "optional_req"
    t.text "about"
    t.integer "application_count", default: 0
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
    t.string "professional_title"
    t.text "experience"
    t.text "education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_professionals_on_email"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email"
    t.string "company_name"
    t.string "company_website"
    t.text "company_about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["company_name"], name: "index_recruiters_on_company_name"
    t.index ["email"], name: "index_recruiters_on_email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "professionals"
  add_foreign_key "follows", "professionals"
  add_foreign_key "jobs", "recruiters"
end
