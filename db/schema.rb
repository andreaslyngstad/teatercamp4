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

ActiveRecord::Schema.define(version: 2018_11_11_114926) do

  create_table "camps", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "age1"
    t.integer "age2"
    t.datetime "begin", precision: 6
    t.datetime "end", precision: 6
    t.integer "participants"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "public"
    t.text "ingress"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "des"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_posts", force: :cascade do |t|
    t.integer "category_id", limit: 11, null: false
    t.integer "post_id", limit: 11
    t.index ["category_id"], name: "index_categories_posts_on_category_id"
    t.index ["post_id"], name: "index_categories_posts_on_post_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.string "author"
    t.string "author_email"
    t.text "content"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "credit_notes", force: :cascade do |t|
    t.integer "invoice_id"
    t.float "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_files", force: :cascade do |t|
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.boolean "use"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "registration_id"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "paid"
    t.boolean "sent"
    t.datetime "made_date", precision: 6
    t.datetime "pay_by", precision: 6
    t.datetime "reminder_date", precision: 6
  end

  create_table "options", force: :cascade do |t|
    t.string "app_name"
    t.string "css"
    t.string "owner_name"
    t.string "meta_keywords"
    t.string "meta_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "camp_photo_file_name"
    t.string "camp_photo_content_type"
    t.integer "camp_photo_file_size"
    t.datetime "camp_photo_updated_at", precision: 6
    t.string "blogg_photo_file_name"
    t.string "blogg_photo_content_type"
    t.integer "blogg_photo_file_size"
    t.datetime "blogg_photo_updated_at", precision: 6
    t.string "quote1"
    t.string "quote2"
    t.string "quote3"
    t.string "quote4"
    t.string "account"
    t.string "vat_number"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "body"
    t.integer "parent_id"
    t.string "navlabel"
    t.integer "lft"
    t.integer "rgt"
    t.integer "proposed_parent_id", limit: 11
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nav_photo_file_name"
    t.string "nav_photo_content_type"
    t.integer "nav_photo_file_size"
    t.datetime "nav_photo_updated_at", precision: 6
    t.string "main_photo_file_name"
    t.string "main_photo_content_type"
    t.integer "main_photo_file_size"
    t.datetime "main_photo_updated_at", precision: 6
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "author_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "comments_count", limit: 4, default: 0, null: false
    t.text "lead"
  end

  create_table "pricings", force: :cascade do |t|
    t.integer "camp_id"
    t.integer "product_id"
  end

  create_table "products", force: :cascade do |t|
    t.float "total_price"
    t.string "description"
    t.float "vat"
    t.integer "camp_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "parent_one_name"
    t.string "parent_two_name"
    t.string "parent_one_phone"
    t.string "parent_two_phone"
    t.string "billing_email"
    t.text "tell"
    t.text "medical"
    t.integer "camp_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "paid"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", limit: 40
    t.string "first_name", limit: 100, default: ""
    t.string "last_name", limit: 100, default: ""
    t.string "email", limit: 100
    t.string "password_hash"
    t.string "password_salt"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["login"], name: "index_users_on_login", unique: true
  end

end
