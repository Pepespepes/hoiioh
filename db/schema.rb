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

ActiveRecord::Schema.define(version: 2021_11_25_105540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.boolean "employer_associated"
    t.bigint "event_id", null: false
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["volunteer_id"], name: "index_bookings_on_volunteer_id"
  end

  create_table "charities", force: :cascade do |t|
    t.string "charity_name"
    t.string "category"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_charities_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "company_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.integer "duration"
    t.text "description"
    t.integer "number_positions"
    t.bigint "charity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.text "address"
    t.string "event_name"
    t.index ["charity_id"], name: "index_events_on_charity_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "charity_id", null: false
    t.bigint "volunteer_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charity_id"], name: "index_invitations_on_charity_id"
    t.index ["chatroom_id"], name: "index_invitations_on_chatroom_id"
    t.index ["volunteer_id"], name: "index_invitations_on_volunteer_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.boolean "sent_by_charity"
    t.bigint "charity_id", null: false
    t.bigint "chatroom_id", null: false
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charity_id"], name: "index_messages_on_charity_id"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["volunteer_id"], name: "index_messages_on_volunteer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.boolean "sent_by_charity"
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "current_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.integer "age"
    t.boolean "dbs_checked"
    t.bigint "employer_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employer_id"], name: "index_volunteers_on_employer_id"
    t.index ["user_id"], name: "index_volunteers_on_user_id"
  end

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "volunteers"
  add_foreign_key "charities", "users"
  add_foreign_key "employers", "users"
  add_foreign_key "events", "charities"
  add_foreign_key "invitations", "charities"
  add_foreign_key "invitations", "chatrooms"
  add_foreign_key "invitations", "volunteers"
  add_foreign_key "messages", "charities"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "volunteers"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "volunteers", "employers"
  add_foreign_key "volunteers", "users"
end
