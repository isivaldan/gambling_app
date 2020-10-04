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

ActiveRecord::Schema.define(version: 2020_10_04_155206) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.float "money", default: 10000.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "round_details", force: :cascade do |t|
    t.float "betted_money"
    t.integer "chosen_color"
    t.integer "player_id", null: false
    t.integer "round_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_round_details_on_player_id"
    t.index ["round_id"], name: "index_round_details_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "result_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "round_details", "players"
  add_foreign_key "round_details", "rounds"
end
