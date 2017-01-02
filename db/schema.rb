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

ActiveRecord::Schema.define(version: 20160124191058) do

  create_table "bids", force: :cascade do |t|
    t.decimal  "fee",                    precision: 5, scale: 2
    t.integer  "pilot_id"
    t.integer  "load_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.string   "fee_type",   limit: 255
    t.boolean  "confirm"
  end

  add_index "bids", ["load_id"], name: "index_bids_on_load_id"
  add_index "bids", ["pilot_id"], name: "index_bids_on_pilot_id"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "description"
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.string   "zipcode",          limit: 255
    t.string   "contactphone",     limit: 255
    t.string   "contactemail",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "subcategory_id",   limit: 255
    t.string   "shortdescription", limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "pilot_id"
    t.string   "slug"
    t.string   "cellphone"
    t.string   "fax"
    t.string   "website"
    t.string   "blog"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "pinterest"
    t.string   "google"
  end

  add_index "listings", ["pilot_id"], name: "index_listings_on_pilot_id"
  add_index "listings", ["slug"], name: "index_listings_on_slug"

  create_table "loads", force: :cascade do |t|
    t.string   "origin_country",      limit: 255
    t.string   "origin_city",         limit: 255
    t.string   "origin_state",        limit: 255
    t.string   "origin_zipcode",      limit: 255
    t.string   "destination_country", limit: 255
    t.string   "destination_city",    limit: 255
    t.string   "destination_state",   limit: 255
    t.string   "destination_zipcode", limit: 255
    t.decimal  "fee",                             precision: 5, scale: 2
    t.string   "fee_type",            limit: 255
    t.integer  "distance"
    t.datetime "pickup_datetime"
    t.datetime "delivery_datetime"
    t.text     "special_notes"
    t.integer  "pilotcar_count"
    t.boolean  "polecar_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trucker_id"
    t.string   "current_status",      limit: 255,                         default: "ACTIVE"
  end

  add_index "loads", ["current_status"], name: "index_loads_on_current_status"
  add_index "loads", ["delivery_datetime"], name: "index_loads_on_delivery_datetime"
  add_index "loads", ["destination_city"], name: "index_loads_on_destination_city"
  add_index "loads", ["destination_country"], name: "index_loads_on_destination_country"
  add_index "loads", ["destination_state"], name: "index_loads_on_destination_state"
  add_index "loads", ["destination_zipcode"], name: "index_loads_on_destination_zipcode"
  add_index "loads", ["origin_city"], name: "index_loads_on_origin_city"
  add_index "loads", ["origin_country"], name: "index_loads_on_origin_country"
  add_index "loads", ["origin_state"], name: "index_loads_on_origin_state"
  add_index "loads", ["origin_zipcode"], name: "index_loads_on_origin_zipcode"
  add_index "loads", ["pickup_datetime"], name: "index_loads_on_pickup_datetime"
  add_index "loads", ["trucker_id"], name: "index_loads_on_trucker_id"

  create_table "notifications", force: :cascade do |t|
    t.text     "content"
    t.integer  "listing_id"
    t.integer  "trucker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["listing_id"], name: "index_notifications_on_listing_id"
  add_index "notifications", ["trucker_id"], name: "index_notifications_on_trucker_id"

  create_table "pilots", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "zipcode",                limit: 255
    t.string   "contact_name",           limit: 255
    t.string   "contact_phone",          limit: 255
    t.string   "company",                limit: 255
    t.boolean  "admin"
  end

  add_index "pilots", ["city"], name: "index_pilots_on_city"
  add_index "pilots", ["company"], name: "index_pilots_on_company"
  add_index "pilots", ["confirmation_token"], name: "index_pilots_on_confirmation_token", unique: true
  add_index "pilots", ["email"], name: "index_pilots_on_email", unique: true
  add_index "pilots", ["reset_password_token"], name: "index_pilots_on_reset_password_token", unique: true
  add_index "pilots", ["state"], name: "index_pilots_on_state"
  add_index "pilots", ["unlock_token"], name: "index_pilots_on_unlock_token", unique: true
  add_index "pilots", ["zipcode"], name: "index_pilots_on_zipcode"

  create_table "pins", force: :cascade do |t|
    t.string   "description"
    t.integer  "pilot_id"
    t.integer  "listing_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pins", ["listing_id"], name: "index_pins_on_listing_id"
  add_index "pins", ["pilot_id"], name: "index_pins_on_pilot_id"

  create_table "subcategories", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.integer "category_id"
  end

  create_table "truckers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_line1",          limit: 255
    t.string   "address_line2",          limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "zipcode",                limit: 255
    t.string   "contact_name",           limit: 255
    t.string   "contact_phone",          limit: 255
    t.string   "company",                limit: 255
  end

  add_index "truckers", ["city"], name: "index_truckers_on_city"
  add_index "truckers", ["confirmation_token"], name: "index_truckers_on_confirmation_token", unique: true
  add_index "truckers", ["email"], name: "index_truckers_on_email", unique: true
  add_index "truckers", ["reset_password_token"], name: "index_truckers_on_reset_password_token", unique: true
  add_index "truckers", ["state"], name: "index_truckers_on_state"
  add_index "truckers", ["unlock_token"], name: "index_truckers_on_unlock_token", unique: true
  add_index "truckers", ["zipcode"], name: "index_truckers_on_zipcode"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
