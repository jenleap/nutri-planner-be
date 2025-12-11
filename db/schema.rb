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

ActiveRecord::Schema[7.1].define(version: 2025_12_10_215509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_items", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "food_id", null: false
    t.bigint "measure_id", null: false
    t.decimal "quantity", precision: 6, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_items_on_food_id"
    t.index ["meal_id"], name: "index_meal_items_on_meal_id"
    t.index ["measure_id"], name: "index_meal_items_on_measure_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measures", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.decimal "quantity", precision: 6, scale: 2
    t.string "unit"
    t.string "custom_unit"
    t.decimal "calories", precision: 6, scale: 2
    t.decimal "carbs", precision: 6, scale: 2
    t.decimal "protein", precision: 6, scale: 2
    t.decimal "fat", precision: 6, scale: 2
    t.decimal "fiber", precision: 6, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_measures_on_food_id"
  end

  add_foreign_key "meal_items", "foods"
  add_foreign_key "meal_items", "meals"
  add_foreign_key "meal_items", "measures"
  add_foreign_key "measures", "foods"
end
