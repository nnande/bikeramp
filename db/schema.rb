# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171201203958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line", null: false
    t.string "city", null: false
    t.string "country", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2, null: false
    t.datetime "date", null: false
    t.decimal "distance", precision: 5, scale: 2, null: false
    t.integer "start_address_id"
    t.integer "destination_address_id"
    t.index ["date"], name: "index_trips_on_date"
    t.index ["destination_address_id"], name: "index_trips_on_destination_address_id"
    t.index ["start_address_id"], name: "index_trips_on_start_address_id"
  end

  add_foreign_key "trips", "addresses", column: "destination_address_id"
  add_foreign_key "trips", "addresses", column: "start_address_id"
end
