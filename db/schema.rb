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

ActiveRecord::Schema[7.0].define(version: 2023_05_15_171638) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "analyses", force: :cascade do |t|
    t.string "name_analysis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "outpatient_card_id", null: false
    t.date "appointment_date"
    t.string "report"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.datetime "app_time", precision: nil
    t.float "rating"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["outpatient_card_id"], name: "index_appointments_on_outpatient_card_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name_depart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.integer "gender_id", null: false
    t.integer "spec_id", null: false
    t.integer "department_id", null: false
    t.date "start_working_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "category_id", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "rating"
    t.index ["category_id"], name: "index_doctors_on_category_id"
    t.index ["department_id"], name: "index_doctors_on_department_id"
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["gender_id"], name: "index_doctors_on_gender_id"
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
    t.index ["spec_id"], name: "index_doctors_on_spec_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name_gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outpatient_cards", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_outpatient_cards_on_patient_id"
  end

  create_table "patient_analyses", force: :cascade do |t|
    t.integer "analysis_id", null: false
    t.integer "appointment_id", null: false
    t.date "analysis_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_patient_analyses_on_analysis_id"
    t.index ["appointment_id"], name: "index_patient_analyses_on_appointment_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "full_name"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.date "birth_date"
    t.integer "gender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["gender_id"], name: "index_patients_on_gender_id"
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "specs", force: :cascade do |t|
    t.string "name_spec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unavailable_dates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "doctor_id", null: false
    t.integer "leave_type", default: 0
    t.index ["doctor_id"], name: "index_unavailable_dates_on_doctor_id"
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "outpatient_cards"
  add_foreign_key "doctors", "categories"
  add_foreign_key "doctors", "departments"
  add_foreign_key "doctors", "genders"
  add_foreign_key "doctors", "specs"
  add_foreign_key "outpatient_cards", "patients"
  add_foreign_key "patient_analyses", "analyses"
  add_foreign_key "patient_analyses", "appointments"
  add_foreign_key "patients", "genders"
  add_foreign_key "unavailable_dates", "doctors"
end
