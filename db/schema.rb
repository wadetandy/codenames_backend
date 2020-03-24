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

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "codenames_games", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "board_width", null: false
    t.integer "board_height", null: false
    t.jsonb "word_list", null: false
    t.string "first_move", null: false
    t.string "next_move", null: false
    t.bigint "red_team_id", null: false
    t.bigint "blue_team_id", null: false
    t.bigint "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
  end

end
