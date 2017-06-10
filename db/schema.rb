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

ActiveRecord::Schema.define(version: 20150518143642) do

  create_table "addresses", force: :cascade do |t|
    t.string   "type"
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "town"
    t.string   "county"
    t.string   "country"
    t.string   "post_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "employee_id"
  end

  add_index "addresses", ["employee_id"], name: "index_addresses_on_employee_id"

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "employee_id"
    t.integer  "role_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "assignment_id"
    t.integer  "assignment_no"
  end

  add_index "assignments", ["employee_id"], name: "index_assignments_on_employee_id"
  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id"

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "grade"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "competencies", ["employee_id"], name: "index_competencies_on_employee_id"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "service_no"
    t.date     "date_of_birth"
    t.string   "gender"
    t.date     "service_start_date"
    t.string   "substantive_rank"
    t.date     "promotion_date"
    t.string   "passport_number"
    t.date     "passport_expiry"
    t.string   "passport_country_of_origin"
    t.string   "nationality"
    t.string   "national_insurance"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                      default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "activation_digest"
    t.boolean  "activated",                  default: false
    t.datetime "activated_at"
    t.string   "email"
  end

  add_index "employees", ["service_no"], name: "index_employees_on_service_no", unique: true

  create_table "events", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "type"
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "away"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medical_records", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "pstat"
    t.string   "deployability"
    t.date     "hep_a"
    t.date     "hep_a_next"
    t.date     "hep_b"
    t.date     "hep_b_next"
    t.date     "diptheria"
    t.date     "diptheria_next"
    t.date     "polio"
    t.date     "polio_next"
    t.date     "tetanus"
    t.date     "tetanus_next"
    t.date     "typhoid"
    t.date     "typhoid_next"
    t.date     "yellow_fever"
    t.date     "yellow_fever_next"
    t.date     "mmr"
    t.date     "mmr_next"
    t.date     "audio"
    t.date     "audio_next"
    t.string   "blood_group"
    t.integer  "nato_cat"
    t.date     "dental_next"
    t.text     "notes"
  end

  add_index "medical_records", ["employee_id"], name: "index_medical_records_on_employee_id"

  create_table "next_of_kins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "contact_number"
    t.string   "relation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "employee_id"
  end

  add_index "next_of_kins", ["employee_id"], name: "index_next_of_kins_on_employee_id"

  create_table "notes", force: :cascade do |t|
    t.text     "comment"
    t.date     "date"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notes", ["employee_id"], name: "index_notes_on_employee_id"

  create_table "participants", id: false, force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "event_id",    null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "phones", ["employee_id"], name: "index_phones_on_employee_id"

  create_table "qualifications", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "grade"
    t.date     "end_date"
    t.string   "status"
    t.string   "school"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id"

  create_table "reports", force: :cascade do |t|
    t.date     "previous_date"
    t.date     "next_date"
    t.boolean  "mpar"
    t.date     "mpar_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "employee_id"
  end

  add_index "reports", ["employee_id"], name: "index_reports_on_employee_id"

  create_table "responsibilities", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "pid"
    t.string   "description"
    t.string   "ancestry"
    t.string   "section"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "regt_corps"
    t.string   "rank"
    t.string   "main_and_alt_trade"
    t.string   "remarks"
  end

  add_index "roles", ["ancestry"], name: "index_roles_on_ancestry"

  create_table "spouses", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.date     "anniversary"
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "type"
  end

  create_table "trade_careers", force: :cascade do |t|
    t.date     "paab_complete"
    t.string   "paab_result"
    t.date     "next_paab"
    t.boolean  "tiffy_maths_req"
    t.boolean  "tiffy_maths_complete"
    t.date     "class_2"
    t.date     "class_1"
    t.date     "artificer"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "employee_id"
  end

end
