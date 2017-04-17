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

ActiveRecord::Schema.define(version: 20170417093507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title",      limit: 200
    t.string   "author",     limit: 50
    t.string   "summary"
    t.string   "status",     limit: 20,  default: "available"
    t.string   "borrower",   limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["title"], name: "index_books_on_title", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 100
    t.string   "password",        limit: 100
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
