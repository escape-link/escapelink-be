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

ActiveRecord::Schema[7.0].define(version: 2023_10_18_170540) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "puzzle_1_solved", default: 0
    t.integer "puzzle_2_solved", default: 0
    t.integer "puzzle_3_solved", default: 0
    t.integer "puzzle_4_solved", default: 0
    t.integer "puzzle_5_solved", default: 0
    t.string "room_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ready_users", default: [], array: true
    t.boolean "game_started", default: false
    t.text "unique_ready_users", default: [], array: true
  end

  create_table "leaderboards", force: :cascade do |t|
    t.string "group_name"
    t.integer "time_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "content"
    t.string "sender_nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
  end

  add_foreign_key "messages", "channels"
end
