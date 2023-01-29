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

ActiveRecord::Schema[7.0].define(version: 2023_01_29_210514) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prompts", force: :cascade do |t|
    t.string "text", limit: 2000
  end

  create_table "reactions", force: :cascade do |t|
    t.string "emotion"
    t.bigint "response_id"
    t.bigint "user_id"
    t.index ["response_id"], name: "index_reactions_on_response_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "text"
    t.bigint "prompt_id"
    t.bigint "user_id"
    t.index ["prompt_id"], name: "index_responses_on_prompt_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
