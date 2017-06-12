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

ActiveRecord::Schema.define(version: 20170612192842) do

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "product_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_assessed"
    t.boolean "is_active", default: true
    t.boolean "is_assessable", default: true
  end

  create_table "scores", force: :cascade do |t|
    t.integer "a1"
    t.integer "a2"
    t.integer "a3"
    t.integer "a4"
    t.integer "a5"
    t.integer "a6"
    t.integer "a7"
    t.integer "a8"
    t.integer "a9"
    t.integer "a10"
    t.integer "a11"
    t.integer "a12"
    t.integer "b1"
    t.integer "b2"
    t.integer "b3"
    t.integer "b4"
    t.integer "b5"
    t.integer "b6"
    t.integer "b7"
    t.integer "b8"
    t.integer "c1"
    t.integer "c2"
    t.integer "c3"
    t.integer "c4"
    t.integer "c5"
    t.integer "c6"
    t.integer "c7"
    t.integer "c8"
    t.integer "c9"
    t.integer "c10"
    t.integer "d1"
    t.integer "d2"
    t.integer "d3"
    t.integer "d4"
    t.integer "d5"
    t.integer "d6"
    t.integer "d7"
    t.integer "d8"
    t.integer "e1"
    t.integer "e2"
    t.integer "e3"
    t.integer "e4"
    t.float "a"
    t.float "b"
    t.float "c"
    t.float "d"
    t.float "e"
    t.float "total"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "latest"
    t.text "comment"
  end

  create_table "tags", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
