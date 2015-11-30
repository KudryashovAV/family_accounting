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

ActiveRecord::Schema.define(version: 20151127104943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.decimal  "amount",     precision: 12, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
  end

  create_table "costs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.decimal  "price",            precision: 12, scale: 2
    t.date     "reporting_period"
    t.string   "description"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "user_id"
  end

  create_table "planned_costs", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "planned_price",  precision: 12, scale: 2
    t.decimal "real_price",     precision: 12, scale: 2
    t.date    "planned_period"
    t.date    "real_period"
    t.string  "description"
    t.string  "kind"
    t.boolean "paid",                                    default: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "manufacturer"
    t.string   "kind"
    t.integer  "weight",                                 default: 100
    t.integer  "calories"
    t.decimal  "fats",          precision: 12, scale: 6
    t.decimal  "proteins",      precision: 12, scale: 6
    t.decimal  "carbohydrates", precision: 12, scale: 6
    t.decimal  "vitamin_a",     precision: 12, scale: 6
    t.decimal  "vitamin_b1",    precision: 12, scale: 6
    t.decimal  "vitamin_b2",    precision: 12, scale: 6
    t.decimal  "vitamin_b3",    precision: 12, scale: 6
    t.decimal  "vitamin_b4",    precision: 12, scale: 6
    t.decimal  "vitamin_b5",    precision: 12, scale: 6
    t.decimal  "vitamin_b6",    precision: 12, scale: 6
    t.decimal  "vitamin_b7",    precision: 12, scale: 6
    t.decimal  "vitamin_b9",    precision: 12, scale: 6
    t.decimal  "vitamin_b10",   precision: 12, scale: 6
    t.decimal  "vitamin_b11",   precision: 12, scale: 6
    t.decimal  "vitamin_b12",   precision: 12, scale: 6
    t.decimal  "vitamin_b13",   precision: 12, scale: 6
    t.decimal  "vitamin_b15",   precision: 12, scale: 6
    t.decimal  "vitamin_c",     precision: 12, scale: 6
    t.decimal  "vitamin_d",     precision: 12, scale: 6
    t.decimal  "vitamin_e",     precision: 12, scale: 6
    t.decimal  "vitamin_k",     precision: 12, scale: 6
    t.decimal  "vitamin_n",     precision: 12, scale: 6
    t.decimal  "vitamin_p",     precision: 12, scale: 6
    t.decimal  "vitamin_u",     precision: 12, scale: 6
    t.decimal  "calcium",       precision: 12, scale: 6
    t.decimal  "iron",          precision: 12, scale: 6
    t.decimal  "potassium",     precision: 12, scale: 6
    t.decimal  "copper",        precision: 12, scale: 6
    t.decimal  "manganese",     precision: 12, scale: 6
    t.decimal  "magnesium",     precision: 12, scale: 6
    t.decimal  "sodium",        precision: 12, scale: 6
    t.decimal  "sulfur",        precision: 12, scale: 6
    t.decimal  "silicon",       precision: 12, scale: 6
    t.decimal  "zinc",          precision: 12, scale: 6
    t.decimal  "selenium",      precision: 12, scale: 6
    t.decimal  "chrome",        precision: 12, scale: 6
    t.decimal  "iodine",        precision: 12, scale: 6
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "property_type",           limit: 100
    t.integer  "bedrooms",                limit: 2
    t.integer  "bathrooms",               limit: 2
    t.decimal  "price",                               precision: 15, scale: 2
    t.decimal  "size_square_meters",                  precision: 15, scale: 3
    t.integer  "parking_spaces",          limit: 2
    t.text     "description"
    t.string   "realtor_name",            limit: 255
    t.string   "realtor_phone",           limit: 25
    t.string   "realtor_email",           limit: 100
    t.integer  "scrape_id",               limit: 8,                                            null: false
    t.boolean  "found",                                                        default: true
    t.datetime "last_updated",                        precision: 6,                            null: false
    t.string   "site_uid",                limit: 255,                                          null: false
    t.string   "state",                   limit: 150
    t.string   "city",                    limit: 150
    t.string   "neighborhood",            limit: 150
    t.boolean  "should_rescrape_details",                                      default: false, null: false
  end

  add_index "properties", ["found"], name: "properties_found_idx", using: :hash
  add_index "properties", ["last_updated"], name: "properties_last_updated_idx", using: :btree
  add_index "properties", ["scrape_id", "site_uid"], name: "properties_scrape_id_site_uid_idx", unique: true, using: :btree
  add_index "properties", ["scrape_id"], name: "properties_scrape_id_idx", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cost_id"
    t.decimal  "weight",     precision: 12, scale: 2
    t.decimal  "price",      precision: 12, scale: 2
    t.decimal  "unit_price", precision: 12, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
  end

  create_table "scrapes", force: :cascade do |t|
    t.string   "scrape",         limit: 50,               null: false
    t.datetime "last_started",              precision: 6
    t.datetime "last_completed",            precision: 6
  end

  add_index "scrapes", ["scrape"], name: "uniq_idx", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "active",                 default: true, null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.json     "oauth_hash"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "properties", "scrapes", name: "properties_scrape_id_fkey", on_update: :cascade, on_delete: :cascade
end
