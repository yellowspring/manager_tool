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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130705144425) do

  create_table "contracts", :force => true do |t|
    t.string   "description"
    t.string   "product"
    t.string   "client"
    t.string   "salesperson"
    t.string   "contact_email"
    t.date     "send_date"
    t.date     "execute_date"
    t.date     "kick_off_call"
    t.date     "data_received_date"
    t.date     "data_run_date"
    t.date     "first_run_date_in_production"
    t.string   "status"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_contractships", :force => true do |t|
    t.integer  "sales_id"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salespeople", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.date     "dob"
    t.string   "gender"
    t.date     "join_date"
    t.string   "status"
    t.string   "email"
    t.string   "street"
    t.string   "state"
    t.string   "city"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code",     :limit => 10
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "comment"
    t.string   "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
