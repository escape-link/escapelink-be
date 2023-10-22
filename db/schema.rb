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

ActiveRecord::Schema[7.0].define(version: 2023_10_19_193507) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_puzzles", force: :cascade do |t|
    t.integer "puzzle_solved", default: 0
    t.bigint "game_id", null: false
    t.bigint "puzzle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_puzzles_on_game_id"
    t.index ["puzzle_id"], name: "index_game_puzzles_on_puzzle_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "game_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time", precision: nil
    t.bigint "room_id"
    t.index ["game_name"], name: "index_games_on_game_name", unique: true
    t.index ["room_id"], name: "index_games_on_room_id"
  end

  create_table "leaderboards", force: :cascade do |t|
    t.string "game_name"
    t.integer "time_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_leaderboards_on_room_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "content"
    t.string "sender_nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "puzzle_identifier"
    t.index ["room_id"], name: "index_puzzles_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.integer "number_puzzles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_puzzles", "games"
  add_foreign_key "game_puzzles", "puzzles"
  add_foreign_key "games", "rooms"
  add_foreign_key "leaderboards", "rooms"
  add_foreign_key "messages", "channels"
  add_foreign_key "puzzles", "rooms"
end
