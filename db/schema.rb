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

ActiveRecord::Schema.define(:version => 20130815185612) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.integer  "cust_id"
    t.string   "phone"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city",         :limit => 30
    t.string   "contact_name"
    t.boolean  "nda_flag"
    t.date     "baa_send_at"
    t.date     "baa_sign_at"
    t.date     "nda_sign_at"
    t.date     "nda_send_at"
  end

  create_table "contractfiles", :force => true do |t|
    t.integer  "contract_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.string   "status"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_state"
    t.date     "contract_execute_date"
    t.integer  "client_id"
    t.string   "contract_type"
    t.date     "contract_send_at"
    t.date     "contract_sign_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "commercial_rate"
    t.boolean  "medicaid_rate"
    t.boolean  "medicare_rate"
    t.boolean  "transaction_fee"
    t.boolean  "score"
    t.boolean  "subscription_fee"
    t.boolean  "global_rate"
  end

  create_table "sales", :force => true do |t|
    t.integer  "salesperson_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["client_id"], :name => "index_sales_on_contract_id"
  add_index "sales", ["salesperson_id"], :name => "index_sales_on_salesperson_id"

  create_table "salespeople", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "status"
    t.string   "sales_manager"
    t.date     "join_date"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sow_detail_templates", :force => true do |t|
    t.boolean  "commercial_rate"
    t.boolean  "medicare_rate"
    t.boolean  "medicaid_rate"
    t.boolean  "term"
    t.boolean  "development_fee"
    t.boolean  "outgoing_monthly_fee"
    t.boolean  "transaction_net_fee"
    t.integer  "sow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sow_details", :force => true do |t|
    t.float    "commercial_rate"
    t.float    "medicare_rate"
    t.float    "medicaid_rate"
    t.integer  "term"
    t.integer  "version"
    t.float    "transaction_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sow_id"
    t.integer  "subscription_fee"
    t.string   "subtype"
    t.integer  "global_rate"
    t.string   "type"
    t.string   "file"
    t.binary   "filecontent"
  end

  create_table "sows", :force => true do |t|
    t.date     "sow_ko_date"
    t.date     "sow_production_date"
    t.date     "sow_start_date"
    t.date     "sow_end_date"
    t.string   "auto_renew"
    t.integer  "accept_term"
    t.integer  "renew_times"
    t.integer  "product_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id"
    t.date     "ca_sign_at"
    t.boolean  "ca_flag"
    t.date     "ca_send_at"
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
