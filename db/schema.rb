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

ActiveRecord::Schema.define(version: 20150503071505) do

  create_table "budgets", force: true do |t|
    t.string   "title"
    t.integer  "amount"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section",          default: "out", null: false
    t.boolean  "default_income"
    t.boolean  "default_outgoing"
    t.integer  "season_id"
  end

  add_index "budgets", ["season_id"], name: "index_budgets_on_season_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "basic_due",  default: 0
    t.integer  "ext_due",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id"
  end

  add_index "categories", ["season_id"], name: "index_categories_on_season_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "expense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.date     "used_date"
    t.integer  "amount"
    t.text     "description"
    t.text     "user_note"
    t.boolean  "valid_req",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "status",      default: "open"
    t.integer  "budget_id"
    t.integer  "season_id"
  end

  add_index "expenses", ["season_id"], name: "index_expenses_on_season_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "show_order"
    t.integer  "season_id"
  end

  add_index "groups", ["season_id"], name: "index_groups_on_season_id", using: :btree

  create_table "incomes", force: true do |t|
    t.date     "obtained_date"
    t.integer  "amount"
    t.text     "description"
    t.text     "comment"
    t.boolean  "valid_req",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "budget_id"
    t.integer  "season_id"
  end

  add_index "incomes", ["season_id"], name: "index_incomes_on_season_id", using: :btree

  create_table "link_menus", force: true do |t|
    t.string   "viewtext",                  null: false
    t.text     "url",                       null: false
    t.boolean  "enabled",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "fullname"
    t.string   "nick"
    t.string   "yomi"
    t.integer  "obligation",  default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "part_id"
    t.integer  "category_id"
    t.integer  "season_id"
  end

  add_index "members", ["season_id"], name: "index_members_on_season_id", using: :btree

  create_table "parts", force: true do |t|
    t.string   "name"
    t.integer  "show_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.integer  "index",       null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "enabled",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
