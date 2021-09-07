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

ActiveRecord::Schema.define(version: 20210830053549) do

  create_table "acc_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "numtran"
    t.decimal  "balance"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "code"
    t.decimal  "debits",      precision: 8, scale: 2
    t.decimal  "credits",     precision: 8, scale: 2
    t.integer  "acc_type_id"
  end

  create_table "acc_bank_accounts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "opening"
    t.decimal  "outgoing"
    t.decimal  "incoming"
    t.decimal  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
    t.integer  "num_trans"
  end

  create_table "acc_logs", force: :cascade do |t|
    t.integer  "log_id"
    t.integer  "account_id"
    t.integer  "bank_acc_id"
    t.decimal  "debits",      precision: 8, scale: 2
    t.decimal  "decimal",     precision: 8, scale: 2
    t.decimal  "credits",     precision: 8, scale: 2
    t.decimal  "balance",     precision: 8, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "acc_settings", force: :cascade do |t|
    t.string   "bank"
    t.integer  "log_num"
    t.string   "organisation_name"
    t.date     "fin_year_ending"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "acc_trans", force: :cascade do |t|
    t.integer  "log_id"
    t.date     "tdate"
    t.decimal  "amount",              precision: 8, scale: 2
    t.string   "ref1"
    t.string   "ref2"
    t.string   "details"
    t.integer  "acc_bank_account_id"
    t.integer  "acc_account_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "acc_trans", ["acc_account_id"], name: "index_acc_trans_on_acc_account_id"
  add_index "acc_trans", ["acc_bank_account_id"], name: "index_acc_trans_on_acc_bank_account_id"

  create_table "acc_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_settings", force: :cascade do |t|
    t.decimal  "Vrate"
    t.decimal  "Irate"
    t.integer  "LastInvNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "associate_payments", force: :cascade do |t|
    t.date     "datepaid"
    t.decimal  "amount"
    t.string   "reference"
    t.date     "financialto"
    t.integer  "associate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "details"
    t.integer  "pay_type_id"
  end

  add_index "associate_payments", ["associate_id"], name: "index_associate_payments_on_associate_id"

  create_table "associates", force: :cascade do |t|
    t.string   "surname"
    t.string   "first"
    t.string   "title"
    t.string   "email"
    t.string   "payer_name"
    t.string   "payer_title"
    t.string   "payer_email"
    t.date     "financial_to"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "management"
    t.date     "financialto"
    t.string   "phonemobile"
    t.string   "phonework"
    t.string   "phonehome"
    t.string   "payphonemobile"
    t.string   "payphonework"
    t.string   "payphonehome"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.integer  "position_id"
    t.integer  "village_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "title_id"
    t.boolean  "admin"
  end

  add_index "contacts", ["position_id"], name: "index_contacts_on_position_id"
  add_index "contacts", ["village_id"], name: "index_contacts_on_village_id"

  create_table "contacts_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icats_individuals", id: false, force: :cascade do |t|
    t.integer "icat_id"
    t.integer "individual_id"
  end

  add_index "icats_individuals", ["icat_id"], name: "index_icats_individuals_on_icat_id"
  add_index "icats_individuals", ["individual_id"], name: "index_icats_individuals_on_individual_id"

  create_table "individuals", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.string   "address1"
    t.string   "address2"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.date     "financial_to"
    t.integer  "suburb_id"
    t.integer  "status_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "title_id"
    t.string   "suburb"
    t.string   "postcode"
    t.integer  "ivillage_id"
    t.integer  "region_id"
  end

  add_index "individuals", ["ivillage_id"], name: "index_individuals_on_ivillage_id"
  add_index "individuals", ["region_id"], name: "index_individuals_on_region_id"
  add_index "individuals", ["status_id"], name: "index_individuals_on_status_id"
  add_index "individuals", ["suburb_id"], name: "index_individuals_on_suburb_id"
  add_index "individuals", ["title_id"], name: "index_individuals_on_title_id"

  create_table "inews", force: :cascade do |t|
    t.string   "title"
    t.string   "first"
    t.string   "last"
    t.date     "idate"
    t.string   "description"
    t.string   "status"
    t.string   "total"
    t.string   "subject"
    t.text     "body"
    t.string   "fromemail"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ireceipts", force: :cascade do |t|
    t.date     "rdate"
    t.decimal  "amount",        precision: 6, scale: 2
    t.string   "reference"
    t.string   "details"
    t.date     "financial_to"
    t.integer  "individual_id"
    t.integer  "pay_type_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "ireceipts", ["individual_id"], name: "index_ireceipts_on_individual_id"
  add_index "ireceipts", ["pay_type_id"], name: "index_ireceipts_on_pay_type_id"

  create_table "ivillages", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "phone1"
    t.string   "website"
    t.string   "phone2"
    t.string   "address2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "miscellaneous_contacts", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "workphone"
    t.string   "mobilephone"
    t.string   "emailaddress"
    t.integer  "ContactsCategory_id"
    t.text     "notes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "miscellaneous_contacts", ["ContactsCategory_id"], name: "index_miscellaneous_contacts_on_ContactsCategory_id"

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.boolean  "finalised"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pay_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string   "name"
    t.integer  "residents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residents", force: :cascade do |t|
    t.date     "datereceived"
    t.date     "dateaccepted"
    t.string   "surname"
    t.string   "first"
    t.string   "email"
    t.string   "address"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "phone"
    t.date     "dateceased"
    t.string   "comment"
    t.integer  "village_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "residents", ["village_id"], name: "index_residents_on_village_id"

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suburbs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "village_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "village_categories_villages", id: false, force: :cascade do |t|
    t.integer "village_category_id"
    t.integer "village_id"
  end

  add_index "village_categories_villages", ["village_category_id"], name: "index_village_categories_villages_on_village_category_id"
  add_index "village_categories_villages", ["village_id"], name: "index_village_categories_villages_on_village_id"

  create_table "villages", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "phone"
    t.string   "email"
    t.date     "financial_to"
    t.integer  "numres"
    t.integer  "status_id"
    t.integer  "suburb_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "owner"
    t.string   "operator"
    t.string   "memorial_number"
    t.string   "manager"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "website"
    t.string   "phone2"
    t.integer  "region_id"
  end

  add_index "villages", ["region_id"], name: "index_villages_on_region_id"
  add_index "villages", ["status_id"], name: "index_villages_on_status_id"
  add_index "villages", ["suburb_id"], name: "index_villages_on_suburb_id"

  create_table "vreceipts", force: :cascade do |t|
    t.date     "rdate"
    t.string   "reference"
    t.date     "finto"
    t.string   "details"
    t.integer  "village_id"
    t.integer  "pay_type_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "recamount",   precision: 6, scale: 2
  end

  add_index "vreceipts", ["pay_type_id"], name: "index_vreceipts_on_pay_type_id"
  add_index "vreceipts", ["village_id"], name: "index_vreceipts_on_village_id"

end
