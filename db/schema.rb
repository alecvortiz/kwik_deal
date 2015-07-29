# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150728121349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "city_planner"
    t.string   "account_name"
    t.date     "close_date"
    t.string   "feature_country"
    t.string   "name"
    t.string   "payment_terms"
    t.integer  "months_to_expiration"
    t.integer  "capacity_info"
    t.text     "fine_print"
    t.text     "highlights"
    t.text     "description"
    t.string   "fulfill_method"
    t.float    "freight_allowance"
    t.integer  "max_delivery_days"
    t.string   "email_to"
    t.string   "courier"
    t.integer  "shipping_sla"
    t.string   "brand"
    t.string   "stage"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "deal_id"
    t.string   "option_name"
    t.string   "expiration_type"
    t.integer  "months_to_expiration"
    t.integer  "days_to_expiration"
    t.float    "unit_value"
    t.float    "unit_sell_price"
    t.float    "option_commission"
    t.integer  "buyer_max"
    t.integer  "option_cap"
    t.integer  "display_order"
    t.integer  "sell_number"
    t.integer  "units_per_carton"
    t.integer  "cartons_per_pallet"
    t.boolean  "pallets_stackable"
    t.float    "est_shipping_cost"
    t.string   "country_origin"
    t.string   "dimensions_uom"
    t.string   "weight_uom"
    t.float    "retail_package_height"
    t.float    "retail_package_length"
    t.float    "retail_package_width"
    t.float    "retail_package_weight"
    t.float    "product_dimension_height"
    t.float    "product_dimension_length"
    t.float    "product_dimension_width"
    t.float    "product_dimension_weight"
    t.float    "master_carton_height"
    t.float    "master_carton_length"
    t.float    "master_carton_width"
    t.float    "master_carton_weight"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "unit_buy_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.integer  "merchant_id"
    t.string   "account_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
