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

ActiveRecord::Schema.define(version: 2021_11_30_052412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eaten_scraped_food_weights", force: :cascade do |t|
    t.integer "user_diet_log_id", null: false
    t.integer "scraped_food_id", null: false
    t.float "gram"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eaten_user_food_weights", force: :cascade do |t|
    t.integer "user_diet_log_id", null: false
    t.integer "user_created_food_id", null: false
    t.float "gram"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "note"
    t.date "maked_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scraped_foods", force: :cascade do |t|
    t.string "name", null: false
    t.float "protein", null: false
    t.float "fat", null: false
    t.float "carbohydrates", null: false
    t.integer "energy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "targets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "weight"
    t.float "body_fat_rate"
    t.integer "daily_energy"
    t.date "weight_limit"
    t.date "body_fat_rate_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_contents", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", null: false
    t.string "site"
    t.string "part"
    t.text "description"
    t.string "unit", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "training_content_id", null: false
    t.integer "rep", null: false
    t.float "weight"
    t.datetime "done_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_body_compositions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "weight"
    t.float "body_fat_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_created_foods", force: :cascade do |t|
    t.string "name", null: false
    t.float "protein", null: false
    t.float "fat", null: false
    t.float "carbohydrates", null: false
    t.integer "energy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_diet_logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gender", default: 0, null: false
    t.date "birthday"
    t.float "tall"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "eaten_scraped_food_weights", "scraped_foods", on_update: :cascade, on_delete: :cascade
  add_foreign_key "eaten_scraped_food_weights", "user_diet_logs", on_update: :cascade, on_delete: :cascade
  add_foreign_key "eaten_user_food_weights", "user_created_foods", on_update: :cascade, on_delete: :cascade
  add_foreign_key "eaten_user_food_weights", "user_diet_logs", on_update: :cascade, on_delete: :cascade
  add_foreign_key "memos", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "targets", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "trainings", "training_contents", on_update: :cascade, on_delete: :cascade
  add_foreign_key "trainings", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_body_compositions", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_diet_logs", "users", on_update: :cascade, on_delete: :cascade
end
