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

ActiveRecord::Schema.define(version: 2019_02_11_123503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bulky_mail_templates", force: :cascade do |t|
    t.string "name"
    t.text "template"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_features_cars", id: false, force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "car_feature_id", null: false
    t.index ["car_id", "car_feature_id"], name: "index_car_features_cars_on_car_id_and_car_feature_id"
  end

  create_table "car_pictures", force: :cascade do |t|
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "position"
    t.index ["car_id"], name: "index_car_pictures_on_car_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "year"
    t.string "make"
    t.string "model"
    t.string "series"
    t.string "odometer"
    t.string "trans_mission"
    t.string "body_type"
    t.string "color"
    t.string "fuel_type"
    t.string "power"
    t.integer "number_of_seats"
    t.string "drive_type"
    t.text "description"
    t.string "liecense_plate_number"
    t.string "state"
    t.string "insurance_provider"
    t.string "agreed_insurance_value"
    t.integer "daily_drive_limit"
    t.boolean "allow_personal_commercial_use"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cylinders"
    t.float "engine_size"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "comment_files", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "firstname"
    t.string "lastname"
    t.boolean "admin", default: false
    t.string "availibility_days"
    t.string "pickup_suburb"
    t.string "pickup_postcode"
    t.string "pickup_state"
    t.string "rental"
    t.string "advance_notice"
    t.string "driving_liecense_country"
    t.string "driving_liecense_state"
    t.integer "driving_liecense_number"
    t.string "driving_liecense_firstname"
    t.string "driving_liecense_middlename"
    t.string "driving_liecense_lastname"
    t.integer "personal_house_number"
    t.string "personal_street_name"
    t.string "personal_suburb"
    t.string "personal_state"
    t.string "personal_postcode"
    t.date "personal_dob"
    t.string "personal_mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "licensefront_file_name"
    t.string "licensefront_content_type"
    t.integer "licensefront_file_size"
    t.datetime "licensefront_updated_at"
    t.string "licenseback_file_name"
    t.string "licenseback_content_type"
    t.integer "licenseback_file_size"
    t.datetime "licenseback_updated_at"
    t.string "profile_image_file_name"
    t.string "profile_image_content_type"
    t.integer "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.text "comment"
    t.boolean "offers", default: false
    t.datetime "deleted_at"
    t.string "home_phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "violations", force: :cascade do |t|
    t.integer "user_id"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "car_pictures", "cars"
end
