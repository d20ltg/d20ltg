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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151030214219) do
=======
ActiveRecord::Schema.define(version: 20151021212745) do

  create_table "announcements", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
>>>>>>> daf5190eaab9cf13ba255c5cda6b6dcdc1a51965

  create_table "cards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "color"
    t.string   "card_type"
    t.integer  "expansion_id"
  end

  create_table "events", force: true do |t|
    t.string   "event_type"
    t.string   "title"
    t.string   "description"
    t.date     "event_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exapnsions", force: true do |t|
    t.string   "set_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printings", force: true do |t|
    t.integer  "card_id"
    t.integer  "expansion_id"
    t.integer  "card_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
  end

end
