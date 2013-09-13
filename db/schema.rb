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

ActiveRecord::Schema.define(:version => 20130913201045) do

  create_table "autointel_rates", :force => true do |t|
    t.integer  "sow_id"
    t.integer  "version"
    t.integer  "term"
    t.string   "maintype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "AL"
    t.float    "AK"
    t.float    "AZ"
    t.float    "AR"
    t.float    "CA"
    t.float    "CO"
    t.float    "CT"
    t.float    "DE"
    t.float    "DC"
    t.float    "FL"
    t.float    "GA"
    t.float    "HI"
    t.float    "ID"
    t.float    "IL"
    t.float    "IN"
    t.float    "IA"
    t.float    "KS"
    t.float    "KY"
    t.float    "LA"
    t.float    "ME"
    t.float    "MD"
    t.float    "MA"
    t.float    "MI"
    t.float    "MN"
    t.float    "MS"
    t.float    "MO"
    t.float    "MT"
    t.float    "NE"
    t.float    "NV"
    t.float    "NH"
    t.float    "NJ"
    t.float    "NM"
    t.float    "NY"
    t.float    "NC"
    t.float    "ND"
    t.float    "OH"
    t.float    "OK"
    t.float    "OR"
    t.float    "PA"
    t.float    "PR"
    t.float    "RI"
    t.float    "SC"
    t.float    "SD"
    t.float    "TN"
    t.float    "TX"
    t.float    "UT"
    t.float    "VT"
    t.float    "VA"
    t.float    "WA"
    t.float    "WV"
    t.float    "WI"
    t.float    "WY"
  end

  create_table "autointel_state_rates", :force => true do |t|
    t.integer  "autointel_rate_id"
    t.string   "state"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baafiles", :force => true do |t|
    t.integer  "client_id"
    t.string   "file"
    t.binary   "filecontent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "avatar"
    t.integer  "version"
  end

  create_table "ca_files", :force => true do |t|
    t.integer  "contract_id"
    t.string   "file"
    t.binary   "filecontent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charity_rates", :force => true do |t|
    t.integer  "sow_id"
    t.integer  "version"
    t.float    "transaction_fee"
    t.float    "subscription_fee"
    t.integer  "term"
    t.string   "maintype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.boolean  "ca_flag"
    t.date     "ca_send_at"
    t.date     "ca_sign_at"
  end

  create_table "ndafiles", :force => true do |t|
    t.integer  "client_id"
    t.string   "file"
    t.binary   "filecontent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "avatar"
    t.integer  "version"
  end

  create_table "payment_rates", :force => true do |t|
    t.integer  "sow_id"
    t.integer  "version"
    t.float    "transaction_fee"
    t.float    "subscription_fee"
    t.integer  "term"
    t.string   "maintype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payorintel_rates", :force => true do |t|
    t.integer  "sow_id"
    t.integer  "version"
    t.integer  "term"
    t.string   "maintype"
    t.string   "subtype"
    t.float    "commercial"
    t.float    "medicare"
    t.float    "medicaid"
    t.float    "global"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.float    "payment_transaction_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sow_id"
    t.integer  "payment_subscription_fee"
    t.string   "subtype"
    t.integer  "global_rate"
    t.string   "maintype"
    t.string   "file"
    t.binary   "filecontent"
    t.string   "autointel"
    t.float    "charity_transaction_fee"
    t.float    "charity_subscription_fee"
  end

  create_table "sow_files", :force => true do |t|
    t.integer  "sow_id"
    t.integer  "version"
    t.string   "file"
    t.binary   "file_content"
    t.datetime "created_at"
    t.datetime "updated_at"
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
