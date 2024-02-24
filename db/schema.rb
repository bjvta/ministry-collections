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

ActiveRecord::Schema[7.1].define(version: 2024_02_24_170233) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.integer "type"
    t.decimal "amount", precision: 10, scale: 2
    t.bigint "member_id", null: false
    t.integer "income_type", default: 0
    t.decimal "previous_balance", precision: 10, scale: 2
    t.decimal "current_balance", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_balances_on_member_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.text "description"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_expenses_on_member_id"
  end

  create_table "fee_types", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fines", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "fee_type_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "paid_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fee_type_id"], name: "index_fines_on_fee_type_id"
    t.index ["member_id"], name: "index_fines_on_member_id"
  end

  create_table "member_weekly_collections", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "weekly_collection_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "paid_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_weekly_collections_on_member_id"
    t.index ["weekly_collection_id"], name: "index_member_weekly_collections_on_weekly_collection_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.boolean "active"
    t.boolean "enabled_to_pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_collections", force: :cascade do |t|
    t.date "week_date"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "balances", "members"
  add_foreign_key "expenses", "members"
  add_foreign_key "fines", "fee_types"
  add_foreign_key "fines", "members"
  add_foreign_key "member_weekly_collections", "members"
  add_foreign_key "member_weekly_collections", "weekly_collections"
end
