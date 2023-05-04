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

ActiveRecord::Schema[7.0].define(version: 2023_05_04_170844) do
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
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["outpatient_card_id"], name: "index_appointments_on_outpatient_card_id"
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
    t.index ["department_id"], name: "index_doctors_on_department_id"
    t.index ["gender_id"], name: "index_doctors_on_gender_id"
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
    t.integer "outpatient_card_id", null: false
    t.integer "gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_patients_on_gender_id"
    t.index ["outpatient_card_id"], name: "index_patients_on_outpatient_card_id"
  end

  create_table "specs", force: :cascade do |t|
    t.string "name_spec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unavailable_dates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "outpatient_cards"
  add_foreign_key "doctors", "departments"
  add_foreign_key "doctors", "genders"
  add_foreign_key "doctors", "specs"
  add_foreign_key "outpatient_cards", "patients"
  add_foreign_key "patient_analyses", "analyses"
  add_foreign_key "patient_analyses", "appointments"
  add_foreign_key "patients", "genders"
  add_foreign_key "patients", "outpatient_cards"
end
