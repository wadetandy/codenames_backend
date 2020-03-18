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

ActiveRecord::Schema.define(version: 2020_03_18_003723) do

  create_table "codenames_settings", force: :cascade do |t|
    t.integer "board_width", null: false
    t.integer "board_height", null: false
    t.json "word_list", null: false
    t.string "first_move", null: false
    t.string "next_move", null: false
    t.integer "revealed"
  end

  create_table "games", force: :cascade do |t|
    t.string "type"
    t.bigint "settings_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
