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

ActiveRecord::Schema.define(version: 2020_06_06_232204) do

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.boolean "filled", default: false
    t.integer "host_id"
    t.integer "attraction_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_assignments_on_attraction_id"
    t.index ["host_id"], name: "index_assignments_on_host_id"
    t.index ["location_id"], name: "index_assignments_on_location_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "day"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_attractions_on_location_id"
  end

  create_table "experience_reports", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "host_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_experience_reports_on_attraction_id"
    t.index ["host_id"], name: "index_experience_reports_on_host_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "origin"
    t.boolean "admin"
    t.string "uid"
    t.string "provider"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
