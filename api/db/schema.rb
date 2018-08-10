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

ActiveRecord::Schema.define(version: 2018_08_10_213206) do

  create_table "access_tokens", force: :cascade do |t|
    t.string "token", null: false
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_access_tokens_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "login", null: false
    t.text "name", null: false
    t.string "url", null: false
    t.string "avatar_url", null: false
    t.string "provider", null: false
    t.string "email"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "address", null: false
    t.decimal "balance", default: "0.0", null: false
    t.text "alias"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_wallets_on_customer_id"
  end

end
