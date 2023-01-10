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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_015922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.bigint "notice_board_id", null: false
    t.string "head"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notice_board_id"], name: "index_infos_on_notice_board_id"
  end

  create_table "komentars", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.string "headline"
    t.string "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_komentars_on_post_id"
    t.index ["user_id"], name: "index_komentars_on_user_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_newsletters_on_user_id"
  end

  create_table "notice_boards", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_notice_boards_on_admin_id"
  end

  create_table "personal_blogs", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_personal_blogs_on_admin_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "personal_blog_id", null: false
    t.bigint "travel_blog_id", null: false
    t.bigint "project_page_id", null: false
    t.string "headline"
    t.string "topic"
    t.string "description"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_blog_id"], name: "index_posts_on_personal_blog_id"
    t.index ["project_page_id"], name: "index_posts_on_project_page_id"
    t.index ["travel_blog_id"], name: "index_posts_on_travel_blog_id"
  end

  create_table "project_pages", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_project_pages_on_admin_id"
  end

  create_table "travel_blogs", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_travel_blogs_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_users_on_admin_id"
  end

  add_foreign_key "infos", "notice_boards"
  add_foreign_key "komentars", "posts"
  add_foreign_key "komentars", "users"
  add_foreign_key "newsletters", "users"
  add_foreign_key "notice_boards", "admins"
  add_foreign_key "personal_blogs", "admins"
  add_foreign_key "posts", "personal_blogs"
  add_foreign_key "posts", "project_pages"
  add_foreign_key "posts", "travel_blogs"
  add_foreign_key "project_pages", "admins"
  add_foreign_key "travel_blogs", "admins"
  add_foreign_key "users", "admins"
end
