# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_102154) do

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

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dish_ingredients", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_dish_ingredients_on_dish_id"
    t.index ["ingredient_id"], name: "index_dish_ingredients_on_ingredient_id"
  end

  create_table "dish_requests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "dish_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_dish_requests_on_dish_id"
    t.index ["user_id"], name: "index_dish_requests_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dishes_on_user_id"
  end

  create_table "favorite_cuisines", force: :cascade do |t|
    t.bigint "cuisine_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuisine_id"], name: "index_favorite_cuisines_on_cuisine_id"
    t.index ["user_id"], name: "index_favorite_cuisines_on_user_id"
  end

  create_table "favorite_dishes", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_favorite_dishes_on_dish_id"
    t.index ["user_id"], name: "index_favorite_dishes_on_user_id"
  end

  create_table "favorite_locations", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_favorite_locations_on_location_id"
    t.index ["user_id"], name: "index_favorite_locations_on_user_id"
  end

  create_table "favorite_restaurants", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_favorite_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_favorite_restaurants_on_user_id"
  end

  create_table "ingredient_requests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "ingredient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_ingredient_requests_on_ingredient_id"
    t.index ["user_id"], name: "index_ingredient_requests_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ingredients_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
  end

  create_table "menu_dishes", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_menu_dishes_on_dish_id"
    t.index ["menu_id"], name: "index_menu_dishes_on_menu_id"
  end

  create_table "menu_requests", force: :cascade do |t|
    t.string "name"
    t.bigint "menu_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_menu_requests_on_menu_id"
    t.index ["user_id"], name: "index_menu_requests_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.bigint "restaurant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurant_requests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "restaurant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_restaurant_requests_on_restaurant_id"
    t.index ["user_id"], name: "index_restaurant_requests_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.bigint "cuisine_id", null: false
    t.string "address"
    t.index ["cuisine_id"], name: "index_restaurants_on_cuisine_id"
    t.index ["location_id"], name: "index_restaurants_on_location_id"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "review_reactions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "review_id", null: false
    t.bigint "reaction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reaction_id"], name: "index_review_reactions_on_reaction_id"
    t.index ["review_id"], name: "index_review_reactions_on_review_id"
    t.index ["user_id"], name: "index_review_reactions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "restaurant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cuisine_id", null: false
    t.string "nickname"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["cuisine_id"], name: "index_users_on_cuisine_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_views_on_restaurant_id"
    t.index ["user_id"], name: "index_views_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dish_ingredients", "dishes"
  add_foreign_key "dish_ingredients", "ingredients"
  add_foreign_key "dish_requests", "dishes"
  add_foreign_key "dish_requests", "users"
  add_foreign_key "dishes", "users"
  add_foreign_key "favorite_cuisines", "cuisines"
  add_foreign_key "favorite_cuisines", "users"
  add_foreign_key "favorite_dishes", "dishes"
  add_foreign_key "favorite_dishes", "users"
  add_foreign_key "favorite_locations", "locations"
  add_foreign_key "favorite_locations", "users"
  add_foreign_key "favorite_restaurants", "restaurants"
  add_foreign_key "favorite_restaurants", "users"
  add_foreign_key "ingredient_requests", "ingredients"
  add_foreign_key "ingredient_requests", "users"
  add_foreign_key "ingredients", "users"
  add_foreign_key "menu_dishes", "dishes"
  add_foreign_key "menu_dishes", "menus"
  add_foreign_key "menu_requests", "menus"
  add_foreign_key "menu_requests", "users"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "menus", "users"
  add_foreign_key "restaurant_requests", "restaurants"
  add_foreign_key "restaurant_requests", "users"
  add_foreign_key "restaurants", "cuisines"
  add_foreign_key "restaurants", "locations"
  add_foreign_key "restaurants", "users"
  add_foreign_key "review_reactions", "reactions"
  add_foreign_key "review_reactions", "reviews"
  add_foreign_key "review_reactions", "users"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "cuisines"
  add_foreign_key "views", "restaurants"
  add_foreign_key "views", "users"
end
