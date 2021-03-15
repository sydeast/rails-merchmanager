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

ActiveRecord::Schema.define(version: 2021_03_15_043656) do

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "birth_date"
    t.integer "age"
    t.string "other_name"
    t.string "position"
    t.string "company"
    t.string "artist_notes"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "album_id", null: false
    t.index ["album_id"], name: "index_artists_on_album_id"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "photocards", force: :cascade do |t|
    t.string "title"
    t.string "print_type"
    t.string "source_type"
    t.string "source_name"
    t.string "card_type"
    t.integer "card_num"
    t.integer "card_setnum"
    t.string "card_notes"
    t.integer "user_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_photocards_on_artist_id"
    t.index ["user_id"], name: "index_photocards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "artists", "albums"
  add_foreign_key "artists", "users"
  add_foreign_key "photocards", "artists"
  add_foreign_key "photocards", "users"
end
