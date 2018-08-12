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

ActiveRecord::Schema.define(version: 2018_08_11_235618) do

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

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", null: false
    t.datetime "date", null: false
    t.text "message"
    t.integer "sender_wallet_id"
    t.integer "recipient_wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_wallet_id"], name: "index_transactions_on_recipient_wallet_id"
    t.index ["sender_wallet_id"], name: "index_transactions_on_sender_wallet_id"
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
