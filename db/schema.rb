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

ActiveRecord::Schema.define(version: 2021_12_10_045749) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "offer_id", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.decimal "count", precision: 10, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["offer_id"], name: "index_cart_items_on_offer_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer "unit_id", null: false
    t.integer "good_id", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["good_id"], name: "index_offers_on_good_id"
    t.index ["unit_id", "good_id"], name: "index_offers_on_unit_id_and_good_id", unique: true
    t.index ["unit_id"], name: "index_offers_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_units_on_name", unique: true
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "offers"
  add_foreign_key "offers", "goods"
  add_foreign_key "offers", "units"
end
