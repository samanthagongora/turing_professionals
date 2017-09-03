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

ActiveRecord::Schema.define(version: 20170903190239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "twitter"
    t.string "linkedin_url"
  end

  create_table "company_industries", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_industries_on_company_id"
    t.index ["industry_id"], name: "index_company_industries_on_industry_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "email"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.string "favoritable_type"
    t.bigint "favoritable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_locations", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_office_locations_on_company_id"
    t.index ["location_id"], name: "index_office_locations_on_location_id"
  end

  create_table "tech_stacks", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "technology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tech_stacks_on_company_id"
    t.index ["technology_id"], name: "index_tech_stacks_on_technology_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
    t.string "auth_token_linkedin"
    t.integer "uid", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "headline"
    t.text "summary"
    t.string "linkedin_url"
    t.text "image_url"
    t.string "resume"
    t.string "twitter"
    t.string "slack"
    t.string "github"
    t.string "cohort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
    t.bigint "location_id"
    t.integer "status", default: 0
    t.index ["location_id"], name: "index_users_on_location_id"
  end

  create_table "workplaces", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.string "position"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_workplaces_on_company_id"
    t.index ["user_id"], name: "index_workplaces_on_user_id"
  end

  add_foreign_key "company_industries", "companies"
  add_foreign_key "company_industries", "industries"
  add_foreign_key "contacts", "companies"
  add_foreign_key "favorites", "users"
  add_foreign_key "office_locations", "companies"
  add_foreign_key "office_locations", "locations"
  add_foreign_key "tech_stacks", "companies"
  add_foreign_key "tech_stacks", "technologies"
  add_foreign_key "users", "locations"
  add_foreign_key "workplaces", "companies"
  add_foreign_key "workplaces", "users"
end
