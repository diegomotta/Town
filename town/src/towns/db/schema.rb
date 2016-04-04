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

ActiveRecord::Schema.define(version: 20160404202926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text     "line_1"
    t.text     "line_2"
    t.integer  "latitude"
    t.integer  "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delegations", force: :cascade do |t|
    t.integer  "municipality_id"
    t.integer  "chief_id"
    t.integer  "address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "municipality_id"
    t.integer  "person_id"
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "responsible_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "contact_number"
    t.string   "email"
    t.integer  "address_id"
  end

  create_table "market_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "municipalities", force: :cascade do |t|
    t.integer  "mayor_id"
    t.integer  "submayor_id"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "type"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "responsable_id"
    t.string   "email"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "document_type_id"
    t.string   "document_number"
    t.integer  "job_address_id"
    t.date     "birth_date"
    t.integer  "home_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "town_id"
  end

  create_table "radios", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "address_id"
    t.integer  "telefone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
  end

  create_table "supermarkets", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "address_id"
    t.integer  "telefone"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "market_type_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.integer  "year_founded"
    t.integer  "elevation"
    t.integer  "population"
    t.integer  "latitude"
    t.integer  "longitude"
    t.string   "time_zone"
    t.integer  "cpa_base"
    t.string   "dialing_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.string   "subdomain"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.date     "last_signin"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "delegations", "addresses"
  add_foreign_key "delegations", "municipalities"
  add_foreign_key "delegations", "people", column: "chief_id"
  add_foreign_key "departments", "states"
  add_foreign_key "employees", "municipalities"
  add_foreign_key "employees", "people"
  add_foreign_key "municipalities", "addresses"
  add_foreign_key "municipalities", "people", column: "mayor_id"
  add_foreign_key "municipalities", "people", column: "submayor_id"
  add_foreign_key "people", "addresses", column: "home_address_id"
  add_foreign_key "people", "addresses", column: "job_address_id"
  add_foreign_key "people", "document_types"
  add_foreign_key "people", "towns"
  add_foreign_key "radios", "addresses"
  add_foreign_key "radios", "people", column: "owner_id"
  add_foreign_key "states", "countries"
  add_foreign_key "supermarkets", "addresses"
  add_foreign_key "supermarkets", "market_types"
  add_foreign_key "supermarkets", "people", column: "owner_id"
  add_foreign_key "towns", "departments"
end
