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

ActiveRecord::Schema.define(version: 2019_08_13_044822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frame_combos", force: :cascade do |t|
    t.bigint "frame_material_id"
    t.bigint "frame_dimension_id"
    t.integer "price_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_dimension_id"], name: "index_frame_combos_on_frame_dimension_id"
    t.index ["frame_material_id"], name: "index_frame_combos_on_frame_material_id"
  end

  create_table "frame_dimensions", force: :cascade do |t|
    t.integer "height"
    t.integer "width"
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frame_materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.integer "height"
    t.integer "width"
    t.text "description"
    t.string "uploaded_url"
    t.string "api_url"
    t.string "photographer_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "photo_id"
    t.bigint "frame_combo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_combo_id"], name: "index_products_on_frame_combo_id"
    t.index ["photo_id"], name: "index_products_on_photo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_wishlists_on_photo_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "frame_combos", "frame_dimensions"
  add_foreign_key "frame_combos", "frame_materials"
  add_foreign_key "photos", "users"
  add_foreign_key "products", "frame_combos"
  add_foreign_key "products", "photos"
  add_foreign_key "wishlists", "photos"
  add_foreign_key "wishlists", "users"
end
