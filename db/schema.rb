# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_05_102406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bases", force: :cascade do |t|
    t.string "name"
    t.string "base_type"
    t.string "muscular_group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.bigint "workout_id", null: false
    t.integer "index_in_workout"
    t.integer "time_delay_next"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_blocks_on_workout_id"
  end

  create_table "day_sessions", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_day_sessions_on_user_id"
  end

  create_table "exercices", force: :cascade do |t|
    t.string "name"
    t.bigint "base_id", null: false
    t.string "exercice_type"
    t.integer "timer"
    t.integer "number_of_reps"
    t.integer "weight_value"
    t.integer "duration"
    t.text "comment"
    t.bigint "workout_id", null: false
    t.integer "time_delay_next"
    t.integer "index_in_workout"
    t.boolean "belongs_to_block"
    t.integer "index_in_block"
    t.boolean "done", default: false
    t.bigint "block_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["base_id"], name: "index_exercices_on_base_id"
    t.index ["block_id"], name: "index_exercices_on_block_id"
    t.index ["workout_id"], name: "index_exercices_on_workout_id"
  end

  create_table "health_data", force: :cascade do |t|
    t.bigint "day_session_id", null: false
    t.integer "body_weight_main"
    t.integer "body_weight_second"
    t.integer "body_weight"
    t.integer "muscular_mass"
    t.integer "fat_mass"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_session_id"], name: "index_health_data_on_day_session_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.bigint "day_session_id", null: false
    t.boolean "eaten"
    t.boolean "healthy"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "daily_note"
    t.index ["day_session_id"], name: "index_meals_on_day_session_id"
  end

  create_table "ref_blocks", force: :cascade do |t|
    t.string "name"
    t.integer "index_in_workout"
    t.integer "time_delay_next"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ref_blocks_on_user_id"
  end

  create_table "ref_exercices", force: :cascade do |t|
    t.string "name"
    t.bigint "base_id", null: false
    t.string "ref_exercice_type"
    t.integer "timer"
    t.integer "number_of_reps"
    t.integer "weight_value"
    t.integer "duration"
    t.text "comment"
    t.integer "time_delay_next"
    t.integer "index_in_workout"
    t.boolean "belongs_to_block"
    t.integer "index_in_block"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["base_id"], name: "index_ref_exercices_on_base_id"
    t.index ["user_id"], name: "index_ref_exercices_on_user_id"
  end

  create_table "ref_workouts", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ref_workouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "last_sign_in_at"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.date "birthdate"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wbe_tables", force: :cascade do |t|
    t.bigint "ref_workout_id"
    t.bigint "ref_exercice_id"
    t.bigint "ref_block_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_sets", default: 1
    t.index ["ref_block_id"], name: "index_wbe_tables_on_ref_block_id"
    t.index ["ref_exercice_id"], name: "index_wbe_tables_on_ref_exercice_id"
    t.index ["ref_workout_id"], name: "index_wbe_tables_on_ref_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.integer "index"
    t.bigint "day_session_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "duration_theorical"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_session_id"], name: "index_workouts_on_day_session_id"
  end

  add_foreign_key "blocks", "workouts"
  add_foreign_key "day_sessions", "users"
  add_foreign_key "exercices", "bases", column: "base_id"
  add_foreign_key "exercices", "blocks"
  add_foreign_key "exercices", "workouts"
  add_foreign_key "health_data", "day_sessions"
  add_foreign_key "meals", "day_sessions"
  add_foreign_key "ref_blocks", "users"
  add_foreign_key "ref_exercices", "bases", column: "base_id"
  add_foreign_key "ref_exercices", "users"
  add_foreign_key "ref_workouts", "users"
  add_foreign_key "wbe_tables", "ref_blocks"
  add_foreign_key "wbe_tables", "ref_exercices"
  add_foreign_key "wbe_tables", "ref_workouts"
  add_foreign_key "workouts", "day_sessions"
end
