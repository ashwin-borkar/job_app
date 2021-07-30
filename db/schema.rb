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

ActiveRecord::Schema.define(version: 2021_07_30_182233) do

  create_table "educations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cource_name"
    t.string "university_name"
    t.string "passing_year"
    t.integer "percentage"
    t.bigint "user_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_account_id"], name: "index_educations_on_user_account_id"
  end

  create_table "experiences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "company_name"
    t.date "start_date"
    t.date "end_date"
    t.text "designation"
    t.bigint "user_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_account_id"], name: "index_experiences_on_user_account_id"
  end

  create_table "languages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "read"
    t.boolean "write"
    t.boolean "speak"
    t.bigint "user_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_account_id"], name: "index_languages_on_user_account_id"
  end

  create_table "preferences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "location_type"
    t.string "notice_period"
    t.string "expected_ctc"
    t.string "current_ctc"
    t.string "department_type"
    t.bigint "user_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_account_id"], name: "index_preferences_on_user_account_id"
  end

  create_table "refrences_contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ref_name"
    t.string "ref_contact_number"
    t.string "ref_relation"
    t.bigint "user_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_account_id"], name: "index_refrences_contacts_on_user_account_id"
  end

  create_table "technologies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "beginer"
    t.boolean "middeator"
    t.boolean "experter"
    t.bigint "user_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_account_id"], name: "index_technologies_on_user_account_id"
  end

  create_table "user_accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "designation"
    t.text "address1"
    t.text "address2"
    t.string "phone_number"
    t.string "city"
    t.boolean "gender"
    t.string "state"
    t.boolean "relation_status"
    t.date "date_of_birth"
    t.string "zipcode"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "planned", null: false
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "educations", "user_accounts"
  add_foreign_key "experiences", "user_accounts"
  add_foreign_key "languages", "user_accounts"
  add_foreign_key "preferences", "user_accounts"
  add_foreign_key "refrences_contacts", "user_accounts"
  add_foreign_key "technologies", "user_accounts"
  add_foreign_key "user_accounts", "users"
end
