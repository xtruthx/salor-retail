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

ActiveRecord::Schema.define(:version => 20130129143615) do

  create_table "actions", :force => true do |t|
    t.string   "name"
    t.text     "code"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.string   "whento"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "behavior"
    t.integer  "weight",     :default => 0
    t.string   "afield"
    t.float    "value",      :default => 0.0
    t.integer  "hidden",     :default => 0
    t.string   "field2"
    t.float    "value2"
    t.integer  "hidden_by"
  end

  add_index "actions", ["user_id"], :name => "index_actions_on_user_id"
  add_index "actions", ["vendor_id"], :name => "index_actions_on_vendor_id"

  create_table "broken_items", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.float    "quantity"
    t.float    "base_price"
    t.integer  "vendor_id"
    t.integer  "owner_id"
    t.integer  "shipper_id"
    t.string   "owner_type"
    t.text     "note"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "is_shipment_item", :default => false
    t.integer  "hidden",           :default => 0
    t.integer  "hidden_by"
  end

  create_table "buttons", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "old_category_name"
    t.integer  "weight"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "vendor_id"
    t.boolean  "is_buyback",        :default => false
    t.integer  "category_id"
    t.string   "color"
    t.integer  "position"
    t.integer  "hidden",            :default => 0
  end

  create_table "buyers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "id_hash"
  end

  create_table "cash_register_dailies", :force => true do |t|
    t.float    "start_amount"
    t.float    "end_amount"
    t.integer  "cash_register_id"
    t.integer  "employee_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "logout_time"
  end

  add_index "cash_register_dailies", ["cash_register_id"], :name => "index_cash_register_dailies_on_cash_register_id"
  add_index "cash_register_dailies", ["employee_id"], :name => "index_cash_register_dailies_on_employee_id"
  add_index "cash_register_dailies", ["user_id"], :name => "index_cash_register_dailies_on_user_id"

  create_table "cash_registers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "vendor_id"
    t.string   "scale"
    t.boolean  "hidden",                :default => false
    t.boolean  "paylife",               :default => false
    t.string   "bank_machine_path"
    t.string   "cash_drawer_path"
    t.boolean  "big_buttons",           :default => false
    t.boolean  "hide_discounts",        :default => false
    t.boolean  "no_print",              :default => false
    t.string   "thermal_printer",       :default => "/dev/usb/lp0"
    t.string   "sticker_printer",       :default => "/dev/usb/lp1"
    t.string   "a4_printer"
    t.string   "pole_display"
    t.string   "customer_screen_blurb"
    t.boolean  "salor_printer",         :default => true
    t.string   "color"
    t.string   "ip"
    t.boolean  "hide_buttons",          :default => true
    t.boolean  "show_plus_minus",       :default => true
    t.boolean  "detailed_edit"
    t.string   "cash_drawer_name"
    t.string   "thermal_printer_name"
    t.string   "sticker_printer_name"
  end

  add_index "cash_registers", ["vendor_id"], :name => "index_cash_registers_on_vendor_id"

  create_table "categories", :force => true do |t|
    t.integer  "vendor_id"
    t.string   "name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.float    "quantity_sold",   :default => 0.0
    t.float    "cash_made"
    t.boolean  "eod_show",        :default => false
    t.string   "tag"
    t.boolean  "button_category"
    t.integer  "position"
    t.string   "color"
    t.string   "sku"
    t.integer  "hidden",          :default => 0
    t.integer  "hidden_by"
  end

  add_index "categories", ["vendor_id"], :name => "index_categories_on_vendor_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hidden_by"
  end

  create_table "cues", :force => true do |t|
    t.boolean  "is_handled",      :default => false
    t.boolean  "to_send",         :default => false
    t.boolean  "to_receive",      :default => false
    t.text     "payload"
    t.string   "url"
    t.string   "source_sku"
    t.string   "destination_sku"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street1"
    t.string   "street2"
    t.string   "postalcode"
    t.string   "state"
    t.string   "country"
    t.string   "city"
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "email"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "vendor_id"
    t.string   "company_name"
    t.string   "sku"
    t.integer  "hidden",           :default => 0
    t.integer  "hidden_by"
    t.string   "tax_number"
    t.string   "id_hash"
    t.boolean  "signup_activated"
    t.string   "singup_email"
    t.string   "signup_email"
  end

  add_index "customers", ["vendor_id"], :name => "index_customers_on_vendor_id"

  create_table "discounts", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "vendor_id"
    t.integer  "category_id"
    t.integer  "location_id"
    t.string   "item_sku"
    t.string   "applies_to"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.float    "amount"
    t.string   "amount_type"
    t.boolean  "hidden",      :default => false
    t.string   "sku"
    t.integer  "hidden_by"
  end

  add_index "discounts", ["amount_type"], :name => "index_discounts_on_amount_type"
  add_index "discounts", ["applies_to"], :name => "index_discounts_on_applies_to"
  add_index "discounts", ["category_id"], :name => "index_discounts_on_category_id"
  add_index "discounts", ["location_id"], :name => "index_discounts_on_location_id"
  add_index "discounts", ["vendor_id"], :name => "index_discounts_on_vendor_id"

  create_table "discounts_order_items", :id => false, :force => true do |t|
    t.integer "order_item_id"
    t.integer "discount_id"
  end

  add_index "discounts_order_items", ["order_item_id", "discount_id"], :name => "index_discounts_order_items_on_order_item_id_and_discount_id"

  create_table "discounts_orders", :id => false, :force => true do |t|
    t.integer "order_id"
    t.integer "discount_id"
  end

  add_index "discounts_orders", ["order_id", "discount_id"], :name => "index_discounts_orders_on_order_id_and_discount_id"

  create_table "drawer_transactions", :force => true do |t|
    t.integer  "drawer_id"
    t.float    "amount"
    t.boolean  "drop"
    t.boolean  "payout"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "notes"
    t.boolean  "is_refund",        :default => false
    t.string   "tag",              :default => "None"
    t.float    "drawer_amount",    :default => 0.0
    t.integer  "cash_register_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "order_id"
    t.integer  "order_item_id"
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
  end

  add_index "drawer_transactions", ["drawer_id"], :name => "index_drawer_transactions_on_drawer_id"

  create_table "drawers", :force => true do |t|
    t.float    "amount",     :default => 0.0
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "hidden",     :default => 0
  end

  add_index "drawers", ["owner_id"], :name => "index_drawers_on_owner_id"

  create_table "employees", :force => true do |t|
    t.string   "email",                                 :default => "",                :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",                :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_id"
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.string   "username"
    t.integer  "vendor_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "language"
    t.string   "theme"
    t.boolean  "js_keyboard",                           :default => false
    t.integer  "hidden",                                :default => 0
    t.string   "apitoken"
    t.integer  "uses_drawer_id"
    t.integer  "auth_code"
    t.string   "last_path",                             :default => "/cash_registers"
    t.string   "role_cache"
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["reset_password_token"], :name => "index_employees_on_reset_password_token", :unique => true
  add_index "employees", ["user_id"], :name => "index_employees_on_user_id"
  add_index "employees", ["vendor_id"], :name => "index_employees_on_vendor_id"

  create_table "employees_roles", :id => false, :force => true do |t|
    t.integer "employee_id"
    t.integer "role_id"
  end

  add_index "employees_roles", ["employee_id", "role_id"], :name => "index_employees_roles_on_employee_id_and_role_id"

  create_table "errors", :force => true do |t|
    t.text     "msg"
    t.integer  "vendor_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "applies_to_type"
    t.integer  "applies_to_id"
    t.boolean  "seen",            :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "url"
    t.string   "referer"
  end

  create_table "histories", :force => true do |t|
    t.string   "url"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "action_taken"
    t.string   "model_type"
    t.string   "ip"
    t.integer  "sensitivity"
    t.integer  "model_id"
    t.text     "changes_made"
    t.text     "params"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "inventory_report_items", :force => true do |t|
    t.integer  "inventory_report_id"
    t.integer  "item_id"
    t.float    "real_quantity"
    t.float    "item_quantity"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "vendor_id"
  end

  add_index "inventory_report_items", ["inventory_report_id"], :name => "index_inventory_report_items_on_inventory_report_id"
  add_index "inventory_report_items", ["item_id"], :name => "index_inventory_report_items_on_item_id"
  add_index "inventory_report_items", ["vendor_id"], :name => "index_inventory_report_items_on_vendor_id"

  create_table "inventory_reports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vendor_id"
  end

  add_index "inventory_reports", ["vendor_id"], :name => "index_inventory_reports_on_vendor_id"

  create_table "invoice_blurbs", :force => true do |t|
    t.string   "lang"
    t.text     "body"
    t.boolean  "is_header"
    t.integer  "vendor_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "body_receipt"
  end

  create_table "invoice_notes", :force => true do |t|
    t.string   "name"
    t.text     "note_header"
    t.text     "note_footer"
    t.integer  "origin_country_id"
    t.integer  "destination_country_id"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.integer  "sale_type_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "item_shippers", :force => true do |t|
    t.integer  "shipper_id"
    t.integer  "item_id"
    t.float    "purchase_price"
    t.float    "list_price"
    t.string   "item_sku"
    t.string   "shipper_sku"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "item_shippers", ["item_id"], :name => "index_item_shippers_on_item_id"
  add_index "item_shippers", ["shipper_id"], :name => "index_item_shippers_on_shipper_id"

  create_table "item_types", :force => true do |t|
    t.string   "name"
    t.string   "behavior"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "sku"
    t.string   "image"
    t.integer  "vendor_id"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.float    "base_price",                          :default => 0.0
    t.integer  "location_id"
    t.integer  "category_id"
    t.integer  "tax_profile_id"
    t.integer  "item_type_id"
    t.float    "amount_remaining",                    :default => 0.0
    t.boolean  "activated",                           :default => false
    t.integer  "void"
    t.integer  "coupon_type"
    t.string   "coupon_applies"
    t.float    "quantity",                            :default => 0.0
    t.float    "quantity_sold",                       :default => 0.0
    t.integer  "hidden",                              :default => 0
    t.integer  "part_id"
    t.boolean  "calculate_part_price",                :default => false
    t.float    "height",                              :default => 0.0
    t.float    "weight",                              :default => 0.0
    t.string   "height_metric"
    t.string   "weight_metric",                       :default => "g"
    t.float    "length",                              :default => 0.0
    t.float    "width",                               :default => 0.0
    t.string   "length_metric"
    t.string   "width_metric"
    t.integer  "is_part"
    t.boolean  "is_gs1",                              :default => false
    t.boolean  "price_by_qty"
    t.integer  "decimal_points"
    t.float    "part_quantity",                       :default => 0.0
    t.string   "behavior"
    t.float    "tax_profile_amount",                  :default => 0.0
    t.string   "sales_metric"
    t.float    "purchase_price",                      :default => 0.0
    t.date     "expires_on"
    t.float    "buyback_price",                       :default => 0.0
    t.integer  "quantity_buyback",                    :default => 0
    t.boolean  "default_buyback",                     :default => false
    t.float    "real_quantity",                       :default => 0.0
    t.boolean  "weigh_compulsory",                    :default => false
    t.float    "min_quantity",                        :default => 0.0
    t.boolean  "active",                              :default => true
    t.integer  "shipper_id"
    t.string   "shipper_sku"
    t.float    "packaging_unit",                      :default => 1.0
    t.boolean  "ignore_qty",                          :default => false
    t.integer  "child_id",                            :default => 0
    t.boolean  "must_change_price",                   :default => false
    t.boolean  "hidden_by_distiller",                 :default => false
    t.boolean  "track_expiry",                        :default => false
    t.string   "customs_code"
    t.float    "manufacturer_price"
    t.string   "origin_country"
    t.text     "name_translations"
    t.integer  "hidden_by"
    t.boolean  "real_quantity_updated"
    t.integer  "unit_price_cents"
    t.string   "unit_price_currency"
    t.boolean  "digital_content"
    t.boolean  "subscription"
    t.text     "digital_content_permissions"
    t.string   "subscription_type"
    t.boolean  "subscription_subdomain_required"
    t.datetime "subscription_start_date"
    t.integer  "subscription_times"
    t.string   "subscription_api_url"
    t.text     "subscription_api_params_subscribe"
    t.text     "subscription_api_params_unsubscribe"
    t.string   "subscription_period"
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["coupon_applies"], :name => "index_items_on_coupon_applies"
  add_index "items", ["coupon_type"], :name => "index_items_on_coupon_type"
  add_index "items", ["item_type_id"], :name => "index_items_on_item_type_id"
  add_index "items", ["location_id"], :name => "index_items_on_location_id"
  add_index "items", ["part_id"], :name => "index_items_on_part_id"
  add_index "items", ["sku"], :name => "index_items_on_sku"
  add_index "items", ["tax_profile_id"], :name => "index_items_on_tax_profile_id"
  add_index "items", ["vendor_id"], :name => "index_items_on_vendor_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.float    "x"
    t.float    "y"
    t.string   "shape"
    t.integer  "vendor_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "applies_to"
    t.float    "quantity_sold", :default => 0.0
    t.float    "cash_made",     :default => 0.0
    t.integer  "hidden",        :default => 0
    t.string   "sku",           :default => ""
    t.integer  "hidden_by"
  end

  add_index "locations", ["vendor_id"], :name => "index_locations_on_vendor_id"

  create_table "loyalty_cards", :force => true do |t|
    t.integer  "points"
    t.integer  "num_swipes"
    t.integer  "num_used"
    t.integer  "customer_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "sku"
    t.string   "customer_sku"
    t.integer  "hidden",       :default => 0
    t.integer  "vendor_id"
  end

  add_index "loyalty_cards", ["customer_id"], :name => "index_loyalty_cards_on_customer_id"
  add_index "loyalty_cards", ["sku"], :name => "index_loyalty_cards_on_sku"

  create_table "meta", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "crd_id"
    t.integer  "order_id"
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "cash_register_id"
    t.integer  "last_order_id"
    t.string   "color"
  end

  add_index "meta", ["cash_register_id"], :name => "index_meta_on_cash_register_id"
  add_index "meta", ["crd_id"], :name => "index_meta_on_crd_id"
  add_index "meta", ["order_id"], :name => "index_meta_on_order_id"
  add_index "meta", ["ownable_id"], :name => "index_meta_on_ownable_id"
  add_index "meta", ["ownable_type"], :name => "index_meta_on_ownable_type"
  add_index "meta", ["vendor_id"], :name => "index_meta_on_vendor_id"

  create_table "node_messages", :force => true do |t|
    t.string   "source_sku"
    t.string   "dest_sku"
    t.string   "mdhash"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "node_queues", :force => true do |t|
    t.boolean  "handled",         :default => false
    t.boolean  "send",            :default => false
    t.boolean  "receive",         :default => false
    t.text     "payload"
    t.string   "url"
    t.string   "source_sku"
    t.string   "destination_sku"
    t.string   "owner_type"
    t.integer  "owner_ir"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "token"
    t.string   "node_type"
    t.string   "url"
    t.boolean  "is_self"
    t.text     "accepted_ips"
    t.integer  "vendor_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "status"
    t.boolean  "is_busy",               :default => false
    t.integer  "hidden",                :default => 0
    t.boolean  "accepts_tax_profiles",  :default => true
    t.boolean  "accepts_buttons",       :default => true
    t.boolean  "accepts_categories",    :default => true
    t.boolean  "accepts_items",         :default => true
    t.boolean  "accepts_customers",     :default => true
    t.boolean  "accepts_loyalty_cards", :default => true
    t.boolean  "accepts_discounts",     :default => true
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.integer  "user_id"
    t.integer  "employee_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "notes", ["employee_id"], :name => "index_notes_on_employee_id"
  add_index "notes", ["notable_id"], :name => "index_notes_on_notable_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "order s", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.float    "quantity"
    t.float    "price",                 :default => 0.0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "tax_profile_id"
    t.integer  "item_type_id"
    t.boolean  "activated",             :default => false
    t.boolean  "total_is_locked",       :default => false
    t.boolean  "tax_is_locked",         :default => false
    t.float    "total",                 :default => 0.0
    t.float    "tax",                   :default => 0.0
    t.float    "coupon_amount",         :default => 0.0
    t.string   "behavior"
    t.float    "tax_profile_amount",    :default => 0.0
    t.integer  "category_id"
    t.integer  "location_id"
    t.float    "amount_remaining",      :default => 0.0
    t.boolean  "refunded",              :default => false
    t.boolean  "discount_applied",      :default => false
    t.boolean  "coupon_applied",        :default => false
    t.datetime "refunded_at"
    t.integer  "refunded_by"
    t.string   "refunded_by_type"
    t.float    "discount_amount",       :default => 0.0
    t.float    "rebate",                :default => 0.0
    t.integer  "coupon_id",             :default => 0
    t.boolean  "is_buyback",            :default => false
    t.string   "sku"
    t.boolean  "weigh_compulsory",      :default => false
    t.boolean  "no_inc",                :default => false
    t.string   "refund_payment_method"
    t.boolean  "action_applied",        :default => false
    t.integer  "hidden",                :default => 0
    t.float    "rebate_amount",         :default => 0.0
    t.integer  "vendor_id"
    t.boolean  "tax_free",              :default => false
    t.integer  "hidden_by"
    t.integer  "employee_id"
    t.string   "coupon_applies"
  end

  add_index "order_items", ["behavior"], :name => "index_order_items_on_behavior"
  add_index "order_items", ["category_id"], :name => "index_order_items_on_category_id"
  add_index "order_items", ["coupon_id"], :name => "index_order_items_on_coupon_id"
  add_index "order_items", ["is_buyback"], :name => "index_order_items_on_is_buyback"
  add_index "order_items", ["item_id"], :name => "index_order_items_on_item_id"
  add_index "order_items", ["item_type_id"], :name => "index_order_items_on_item_type_id"
  add_index "order_items", ["location_id"], :name => "index_order_items_on_location_id"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["sku"], :name => "index_order_items_on_sku"
  add_index "order_items", ["tax_profile_id"], :name => "index_order_items_on_tax_profile_id"

  create_table "orders", :force => true do |t|
    t.float    "subtotal"
    t.float    "total"
    t.float    "tax"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "paid"
    t.boolean  "refunded",                        :default => false
    t.integer  "employee_id"
    t.integer  "hidden",                          :default => 0
    t.integer  "cash_register_id"
    t.integer  "customer_id"
    t.boolean  "total_is_locked",                 :default => false
    t.boolean  "tax_is_locked",                   :default => false
    t.boolean  "subtotal_is_locked",              :default => false
    t.integer  "cash_register_daily_id"
    t.float    "rebate",                          :default => 0.0
    t.string   "rebate_type",                     :default => "percent"
    t.integer  "lc_points"
    t.float    "in_cash",                         :default => 0.0
    t.float    "by_card",                         :default => 0.0
    t.datetime "refunded_at"
    t.integer  "refunded_by"
    t.string   "refunded_by_type"
    t.float    "discount_amount",                 :default => 0.0
    t.string   "tag"
    t.boolean  "buy_order",                       :default => false
    t.float    "lc_discount_amount",              :default => 0.0
    t.text     "bk_msgs_received"
    t.string   "p_result"
    t.string   "p_text"
    t.text     "p_struct"
    t.text     "m_struct"
    t.text     "j_struct"
    t.text     "j_text"
    t.string   "j_ind"
    t.boolean  "was_printed"
    t.float    "front_end_change",                :default => 0.0
    t.string   "sku"
    t.integer  "drawer_id"
    t.boolean  "tax_free",                        :default => false
    t.integer  "origin_country_id"
    t.integer  "destination_country_id"
    t.integer  "sale_type_id"
    t.text     "invoice_comment"
    t.text     "delivery_note_comment"
    t.integer  "nr"
    t.boolean  "is_proforma",                     :default => false
    t.integer  "hidden_by"
    t.integer  "buyer_id"
    t.string   "google_order_number"
    t.integer  "total_cents"
    t.string   "total_currency"
    t.integer  "last_charged_amount_cents"
    t.string   "last_charged_amount_currency"
    t.integer  "last_authorized_amount_cents"
    t.string   "last_authorized_amount_currency"
    t.integer  "refund_amount_cents"
    t.string   "refund_amount_currency"
    t.integer  "unit_price_cents"
    t.string   "unit_price_currency"
  end

  add_index "orders", ["cash_register_daily_id"], :name => "index_orders_on_cash_register_daily_id"
  add_index "orders", ["cash_register_id"], :name => "index_orders_on_cash_register_id"
  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["employee_id"], :name => "index_orders_on_employee_id"
  add_index "orders", ["location_id"], :name => "index_orders_on_location_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"
  add_index "orders", ["vendor_id"], :name => "index_orders_on_vendor_id"

  create_table "paylife_structs", :force => true do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "vendor_id"
    t.integer  "cash_register_id"
    t.integer  "order_id"
    t.text     "struct"
    t.text     "json"
    t.boolean  "tes",              :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "sa"
    t.string   "ind"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "name"
    t.string   "internal_type"
    t.float    "amount",        :default => 0.0
    t.integer  "order_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "vendor_id"
  end

  add_index "payment_methods", ["order_id"], :name => "index_payment_methods_on_order_id"

  create_table "receipts", :force => true do |t|
    t.string   "ip"
    t.integer  "employee_id"
    t.integer  "cash_register_id"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sale_types", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hidden_by"
  end

  create_table "salor_cart_authorization_amount_notifications", :force => true do |t|
    t.string   "serial_number"
    t.string   "google_order_number"
    t.integer  "authorization_amount_cents",    :default => 0,     :null => false
    t.string   "authorization_amount_currency", :default => "USD", :null => false
    t.datetime "authorization_expiration_date"
    t.string   "avs_response"
    t.string   "cvn_response"
    t.datetime "timestamp"
    t.integer  "raw_google_notification_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "order_id"
  end

  create_table "salor_cart_buyers", :force => true do |t|
    t.string   "sku"
    t.boolean  "marketing_preferences_email_allowed"
    t.string   "billing_phone"
    t.string   "billing_fax"
    t.string   "billing_last_name"
    t.string   "billing_first_name"
    t.string   "billing_email"
    t.string   "billing_contact_name"
    t.string   "billing_company_name"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_postal_code"
    t.string   "billing_country_code"
    t.string   "billing_city"
    t.string   "billing_region"
    t.string   "shipping_phone"
    t.string   "shipping_fax"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
    t.string   "shipping_email"
    t.string   "shipping_contact_name"
    t.string   "shipping_company_name"
    t.string   "shipping_address1"
    t.string   "shipping_address2"
    t.string   "shipping_postal_code"
    t.string   "shipping_country_code"
    t.string   "shipping_city"
    t.string   "shipping_region"
    t.string   "signup_email"
    t.string   "signup_ip"
    t.boolean  "signup_activation_email_sent"
    t.boolean  "signup_completed"
    t.string   "password_salt"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "id_hash"
    t.string   "password_encrypted"
    t.string   "activation_salt"
    t.boolean  "signup_password_email_sent"
    t.boolean  "signup_activated"
  end

  create_table "salor_cart_cancelled_subscription_notifications", :force => true do |t|
    t.string   "serial_number"
    t.datetime "timestamp"
    t.string   "reason"
    t.string   "item_ids",                   :limit => 10000, :default => "--- []\n"
    t.string   "google_order_number"
    t.integer  "raw_google_notification_id"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.integer  "order_id"
  end

  create_table "salor_cart_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "salor_cart_charge_amount_notifications", :force => true do |t|
    t.integer  "latest_charge_amount_cents"
    t.string   "latest_charge_amount_currency"
    t.integer  "total_charge_amount_cents"
    t.string   "total_charge_amount_currency"
    t.integer  "latest_charge_fee_total_cents"
    t.string   "latest_charge_fee_total_currency"
    t.integer  "latest_charge_fee_flat_cents"
    t.string   "latest_charge_fee_flat_currency"
    t.string   "latest_charge_fee_percentage"
    t.datetime "timestamp"
    t.integer  "order_id"
    t.integer  "raw_google_notification_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "google_order_number"
  end

  create_table "salor_cart_items", :force => true do |t|
    t.integer  "order_id"
    t.string   "name"
    t.integer  "quantity"
    t.integer  "unit_price_cents",                              :default => 0,     :null => false
    t.string   "unit_price_currency",                           :default => "USD", :null => false
    t.string   "description"
    t.string   "sku"
    t.boolean  "digital_content"
    t.string   "digital_content_key"
    t.string   "digital_content_url"
    t.string   "digital_content_description"
    t.boolean  "subscription"
    t.string   "subscription_period"
    t.string   "subscription_type"
    t.datetime "subscription_start_date"
    t.integer  "subscription_maximum_charge_cents",             :default => 0,     :null => false
    t.string   "subscription_maximum_charge_currency",          :default => "USD", :null => false
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "product_id"
    t.integer  "total_cents",                                   :default => 0,     :null => false
    t.string   "total_currency",                                :default => "USD", :null => false
    t.integer  "subscription_times"
    t.datetime "payment_last_date"
    t.datetime "subscription_recurrence_request_last_date"
    t.integer  "subscription_recurrence_request_last_cents"
    t.string   "subscription_recurrence_request_last_currency"
    t.string   "subscription_subdomain"
    t.boolean  "subscription_subdomain_required"
    t.string   "subscription_host"
    t.boolean  "subscription_active"
    t.boolean  "cancelled"
    t.integer  "product_unit_price_cents"
    t.integer  "product_unit_price_currency"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.string   "subscription_api_url"
    t.boolean  "subscription_cancelled"
    t.datetime "cancelled_at"
    t.datetime "subscription_cancelled_at"
  end

  create_table "salor_cart_new_order_notifications", :force => true do |t|
    t.string   "serial_number"
    t.datetime "timestamp"
    t.string   "google_order_number"
    t.integer  "order_total_cents",                                :default => 0,     :null => false
    t.string   "order_total_currency",                             :default => "USD", :null => false
    t.string   "fulfillment_order_state"
    t.string   "financial_order_state"
    t.string   "buyer_id"
    t.integer  "order_adjustment_total_tax_cents",                 :default => 0,     :null => false
    t.string   "order_adjustment_total_tax_currency",              :default => "USD", :null => false
    t.boolean  "order_adjustment_merchant_calculation_successful"
    t.integer  "order_adjustment_adjustment_total_cents",          :default => 0,     :null => false
    t.string   "order_adjustment_adjustment_total_currency",       :default => "USD", :null => false
    t.string   "merchant_order_number"
    t.integer  "order_id"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.integer  "raw_google_notification_id"
  end

  create_table "salor_cart_option_items", :force => true do |t|
    t.integer  "option_id"
    t.integer  "unit_price_cents",            :default => 0,     :null => false
    t.string   "unit_price_currency",         :default => "USD", :null => false
    t.string   "name"
    t.string   "description"
    t.text     "digital_content_permissions"
    t.integer  "product_id"
    t.integer  "item_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "order_id"
    t.integer  "total_cents",                 :default => 0,     :null => false
    t.string   "total_currency",              :default => "USD", :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
  end

  create_table "salor_cart_options", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "product_id"
    t.text     "digital_content_permissions"
    t.integer  "unit_price_cents",                    :default => 0,     :null => false
    t.string   "unit_price_currency",                 :default => "USD", :null => false
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.text     "subscription_api_params_subscribe"
    t.text     "subscription_api_params_unsubscribe"
  end

  create_table "salor_cart_order_state_change_notifications", :force => true do |t|
    t.datetime "timestamp"
    t.string   "serial_number"
    t.string   "google_order_number"
    t.string   "new_financial_order_state"
    t.string   "previous_financial_order_state"
    t.string   "new_fulfillment_order_state"
    t.string   "previous_fulfillment_order_state"
    t.string   "reason"
    t.integer  "raw_google_notification_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "order_id"
  end

  create_table "salor_cart_orders", :force => true do |t|
    t.string   "google_order_number"
    t.string   "merchant_order_number"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.integer  "buyer_id"
    t.integer  "total_cents",                     :default => 0,     :null => false
    t.string   "total_currency",                  :default => "USD", :null => false
    t.boolean  "completed"
    t.boolean  "payment_provider_redirected"
    t.string   "payment_provider"
    t.string   "payment_provider_redirect_url"
    t.string   "google_analytics_data"
    t.boolean  "contains_subscription_item"
    t.boolean  "cancelled"
    t.boolean  "charged"
    t.boolean  "shipped"
    t.datetime "last_charged_at"
    t.integer  "last_charged_amount_cents",       :default => 0
    t.string   "last_charged_amount_currency"
    t.boolean  "charge_and_ship_sent"
    t.string   "financial_state"
    t.string   "fulfillment_state"
    t.integer  "last_authorized_amount_cents",    :default => 0
    t.string   "last_authorized_amount_currency"
    t.boolean  "refunded"
    t.datetime "last_refunded_at"
    t.datetime "cancelled_at"
    t.integer  "refund_amount_cents",             :default => 0,     :null => false
    t.string   "refund_amount_currency",          :default => "USD", :null => false
    t.datetime "shipped_at"
  end

  create_table "salor_cart_products", :force => true do |t|
    t.string   "name"
    t.text     "digital_content_permissions"
    t.integer  "unit_price_cents",                    :default => 0,     :null => false
    t.string   "unit_price_currency",                 :default => "USD", :null => false
    t.integer  "category_id"
    t.string   "description"
    t.string   "sku"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.boolean  "digital_content"
    t.boolean  "subscription"
    t.string   "subscription_type"
    t.string   "subscription_period"
    t.boolean  "subscription_subdomain_required"
    t.datetime "subscription_start_date"
    t.integer  "subscription_times"
    t.string   "subscription_api_url"
    t.text     "subscription_api_params_subscribe"
    t.text     "subscription_api_params_unsubscribe"
  end

  create_table "salor_cart_raw_google_notifications", :force => true do |t|
    t.string   "klass"
    t.text     "raw_xml",             :limit => 16777215
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "google_order_number"
    t.integer  "order_id"
    t.boolean  "incoming"
  end

  create_table "salor_cart_refund_amount_notifications", :force => true do |t|
    t.string   "google_order_number"
    t.integer  "order_id"
    t.integer  "raw_google_notification_id"
    t.integer  "latest_refund_amount_cents",        :default => 0,     :null => false
    t.string   "latest_refund_amount_currency",     :default => "USD", :null => false
    t.integer  "total_refund_amount_cents",         :default => 0,     :null => false
    t.string   "total_refund_amount_currency",      :default => "USD", :null => false
    t.integer  "latest_fee_refund_amount_cents",    :default => 0,     :null => false
    t.string   "latest_fee_refund_amount_currency", :default => "USD", :null => false
    t.datetime "timestamp"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "salor_cart_risk_information_notifications", :force => true do |t|
    t.string   "serial_number"
    t.datetime "timestamp"
    t.string   "partial_card_number"
    t.string   "ip_address"
    t.string   "google_order_number"
    t.boolean  "eligible_for_protection"
    t.string   "cvn_response"
    t.integer  "buyer_account_age"
    t.string   "avs_response"
    t.integer  "raw_google_notification_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "order_id"
  end

  create_table "salor_cart_tracking_informations", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.string   "carrier"
    t.string   "tracking_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "salor_cart_users", :force => true do |t|
    t.string   "technician_email"
    t.string   "password"
    t.string   "password_encrypted"
    t.string   "password_salt"
    t.integer  "role",               :default => 10
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "id_hash"
  end

  create_table "salor_configurations", :force => true do |t|
    t.integer  "vendor_id"
    t.float    "lp_per_dollar"
    t.float    "dollar_per_lp"
    t.text     "address"
    t.string   "telephone"
    t.text     "receipt_blurb"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "pagination",            :default => 12
    t.string   "stylesheets"
    t.string   "cash_drawer"
    t.boolean  "open_cash_drawer",      :default => false
    t.datetime "last_wholesaler_check"
    t.text     "csv_imports"
    t.string   "csv_imports_url"
    t.string   "paylife_sa",            :default => "E"
    t.string   "paylife_version",       :default => "1"
    t.string   "paylife_euro"
    t.string   "paylife_konto",         :default => "01"
    t.string   "paylife_ind",           :default => "U"
    t.boolean  "auto_drop",             :default => false
    t.boolean  "items_view_list",       :default => true
    t.string   "url",                   :default => "http://salor"
    t.boolean  "salor_printer",         :default => false
    t.text     "receipt_blurb_footer"
    t.boolean  "calculate_tax",         :default => false
    t.boolean  "license_accepted",      :default => false
    t.boolean  "csv_categories"
    t.boolean  "csv_buttons"
    t.boolean  "csv_discounts"
    t.boolean  "csv_customers"
    t.boolean  "csv_loyalty_cards"
    t.text     "invoice_blurb"
    t.text     "invoice_blurb_footer"
  end

  add_index "salor_configurations", ["vendor_id"], :name => "index_configurations_on_vendor_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shipment_items", :force => true do |t|
    t.string   "name"
    t.float    "base_price"
    t.integer  "category_id"
    t.integer  "location_id"
    t.integer  "item_type_id"
    t.string   "sku"
    t.integer  "shipment_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "in_stock",       :default => false
    t.float    "quantity"
    t.float    "purchase_price"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.integer  "vendor_id"
  end

  add_index "shipment_items", ["category_id"], :name => "index_shipment_items_on_category_id"
  add_index "shipment_items", ["item_type_id"], :name => "index_shipment_items_on_item_type_id"
  add_index "shipment_items", ["location_id"], :name => "index_shipment_items_on_location_id"
  add_index "shipment_items", ["shipment_id"], :name => "index_shipment_items_on_shipment_id"

  create_table "shipment_items_stock_locations", :id => false, :force => true do |t|
    t.integer "shipment_item_id"
    t.integer "stock_location_id"
  end

  add_index "shipment_items_stock_locations", ["shipment_item_id", "stock_location_id"], :name => "shipment_items_stock"

  create_table "shipment_types", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "hidden",     :default => 0
    t.integer  "vendor_id"
    t.integer  "hidden_by"
  end

  add_index "shipment_types", ["name"], :name => "index_shipment_types_on_name"
  add_index "shipment_types", ["user_id"], :name => "index_shipment_types_on_user_id"

  create_table "shipments", :force => true do |t|
    t.string   "receiver_id"
    t.string   "shipper_id"
    t.string   "shipper_type"
    t.string   "receiver_type"
    t.float    "price"
    t.boolean  "paid"
    t.integer  "user_id"
    t.integer  "employee_id"
    t.string   "status"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "hidden",           :default => 0
    t.integer  "shipment_type_id"
    t.string   "sku"
    t.integer  "hidden_by"
  end

  add_index "shipments", ["employee_id"], :name => "index_shipments_on_employee_id"
  add_index "shipments", ["receiver_id"], :name => "index_shipments_on_receiver_id"
  add_index "shipments", ["shipper_id"], :name => "index_shipments_on_shipper_id"
  add_index "shipments", ["user_id"], :name => "index_shipments_on_user_id"
  add_index "shipments", ["vendor_id"], :name => "index_shipments_on_vendor_id"

  create_table "shippers", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_fax"
    t.string   "contact_email"
    t.integer  "user_id"
    t.integer  "employee_id"
    t.text     "contact_address"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "hidden",          :default => 0
    t.string   "reorder_type"
    t.string   "sku"
    t.integer  "vendor_id"
    t.integer  "hidden_by"
  end

  add_index "shippers", ["employee_id"], :name => "index_shippers_on_employee_id"
  add_index "shippers", ["user_id"], :name => "index_shippers_on_user_id"

  create_table "stock_locations", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
  end

  add_index "stock_locations", ["vendor_id"], :name => "index_stock_locations_on_vendor_id"

  create_table "tax_profiles", :force => true do |t|
    t.string   "name"
    t.float    "value"
    t.integer  "default"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
    t.integer  "hidden",     :default => 0
    t.string   "sku"
    t.integer  "vendor_id"
    t.string   "letter",     :default => "A"
    t.integer  "hidden_by"
  end

  add_index "tax_profiles", ["hidden"], :name => "index_tax_profiles_on_hidden"
  add_index "tax_profiles", ["user_id"], :name => "index_tax_profiles_on_user_id"

  create_table "tender_methods", :force => true do |t|
    t.string   "name"
    t.string   "internal_type"
    t.integer  "vendor_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "hidden",        :default => 0
    t.integer  "hidden_by"
  end

  create_table "transaction_tags", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.binary   "logo_image"
    t.string   "logo_image_content_type"
    t.boolean  "hidden"
    t.integer  "hidden_by"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",         :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",         :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.string   "username"
    t.string   "language"
    t.string   "theme"
    t.boolean  "js_keyboard",                           :default => false
    t.boolean  "is_technician"
    t.integer  "auth_code"
    t.string   "last_path",                             :default => "/vendors"
    t.string   "role_cache"
    t.string   "id_hash"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "usertests", :force => true do |t|
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendor_printers", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "vendor_id"
    t.integer  "cash_register_id"
    t.string   "printer_type"
    t.integer  "copies",           :default => 1
    t.integer  "codepage"
  end

  add_index "vendor_printers", ["cash_register_id"], :name => "index_vendor_printers_on_cash_register_id"
  add_index "vendor_printers", ["vendor_id"], :name => "index_vendor_printers_on_vendor_id"

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "hidden",                          :default => 0
    t.binary   "receipt_logo_header"
    t.binary   "receipt_logo_footer"
    t.string   "logo_image_content_type"
    t.binary   "logo_image"
    t.binary   "logo_invoice_image"
    t.binary   "logo_invoice_image_content_type"
    t.boolean  "multi_currency",                  :default => false
    t.string   "sku"
    t.string   "token"
    t.string   "email"
    t.boolean  "use_order_numbers",               :default => true
    t.string   "unused_order_numbers",            :default => "--- []\n"
    t.integer  "largest_order_number",            :default => 0
    t.integer  "hidden_by"
  end

  add_index "vendors", ["user_id"], :name => "index_vendors_on_user_id"

end
