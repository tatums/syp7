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

ActiveRecord::Schema.define(:version => 20110730142041) do

  create_table "assemblers", :id => false, :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :id => false, :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "contact"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "orders_count",            :default => 0
    t.integer  "product_histories_count", :default => 0
  end

  create_table "days", :force => true do |t|
    t.date     "day"
    t.integer  "month_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchase_orders_count",                                 :default => 0
    t.integer  "orders_count",                                          :default => 0
    t.integer  "transactions_count",                                    :default => 0
    t.integer  "product_histories_count",                               :default => 0
    t.decimal  "gross_sales",                                           :default => 0.0
    t.decimal  "gross_cost",                                            :default => 0.0
    t.decimal  "net_profit",              :precision => 6, :scale => 2, :default => 0.0
  end

  create_table "linecodes", :id => false, :force => true do |t|
    t.integer  "code"
    t.integer  "warehouse"
    t.integer  "line_type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lots", :id => false, :force => true do |t|
    t.date     "date"
    t.integer  "code"
    t.integer  "transaction_code"
    t.integer  "product_code"
    t.integer  "available_qty"
    t.string   "price_uom"
    t.string   "alt_uom"
    t.decimal  "available_price"
    t.integer  "pallet_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "months", :force => true do |t|
    t.integer  "month"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "gross_sales",                               :default => 0.0
    t.decimal  "gross_cost",  :precision => 6, :scale => 2, :default => 0.0
    t.decimal  "net_profit",  :precision => 6, :scale => 2, :default => 0.0
  end

  create_table "orderlines", :id => false, :force => true do |t|
    t.integer  "customer_code"
    t.decimal  "default_cost",        :precision => 6, :scale => 2
    t.decimal  "default_price",       :precision => 6, :scale => 2
    t.decimal  "extended_cost",       :precision => 6, :scale => 2
    t.decimal  "extended_price",      :precision => 6, :scale => 2
    t.integer  "line_number"
    t.integer  "line_type"
    t.decimal  "line_weight",         :precision => 6, :scale => 2
    t.string   "order_uom"
    t.decimal  "lot_total_cost",      :precision => 6, :scale => 2
    t.integer  "order_code"
    t.decimal  "override_cost",       :precision => 6, :scale => 2
    t.string   "pricing_uom"
    t.string   "product_code"
    t.string   "product_description"
    t.decimal  "qty_pricing",         :precision => 6, :scale => 2
    t.decimal  "qty_ordered",         :precision => 6, :scale => 2
    t.decimal  "unit_price",          :precision => 6, :scale => 2
    t.decimal  "unit_cost",           :precision => 6, :scale => 2
    t.decimal  "lot_qty_price",       :precision => 6, :scale => 2
    t.decimal  "lot_qty_alt",         :precision => 6, :scale => 2
    t.date     "order_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :id => false, :force => true do |t|
    t.integer  "code"
    t.integer  "status_code"
    t.integer  "customer_code"
    t.string   "status_description"
    t.integer  "salesperson_code"
    t.integer  "assembler_code"
    t.integer  "shipping_code"
    t.string   "customer_po"
    t.date     "order_date"
    t.decimal  "total_freight",      :precision => 6, :scale => 2
    t.decimal  "total_weight",       :precision => 6, :scale => 2
    t.string   "csr"
    t.decimal  "estimated_amount",   :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_id"
  end

  create_table "product_histories", :force => true do |t|
    t.date     "trans_date"
    t.integer  "product_code"
    t.integer  "whse"
    t.integer  "salesperson_code"
    t.integer  "billing_customer"
    t.string   "po"
    t.integer  "lot_code"
    t.string   "alt_uom"
    t.integer  "alt_qty"
    t.decimal  "prc_qty"
    t.string   "prc_uom"
    t.decimal  "unit_cost"
    t.decimal  "unit_price"
    t.decimal  "weight"
    t.decimal  "total_cost"
    t.decimal  "total_sales"
    t.integer  "trans_type"
    t.string   "trans_desc"
    t.integer  "assembler_code"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :id => false, :force => true do |t|
    t.integer  "code"
    t.string   "description_1"
    t.string   "description_2"
    t.boolean  "active"
    t.integer  "category_code"
    t.string   "apn"
    t.string   "psys"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_lines", :force => true do |t|
    t.string   "po_code"
    t.integer  "product_code"
    t.integer  "record_type"
    t.decimal  "order_qty",          :precision => 6, :scale => 2
    t.string   "order_uom"
    t.string   "pricing_uom"
    t.date     "receipt_date"
    t.decimal  "unit_price",         :precision => 6, :scale => 2
    t.decimal  "est_weight",         :precision => 6, :scale => 2
    t.decimal  "weight_received",    :precision => 6, :scale => 2
    t.decimal  "alt_qty_received",   :precision => 6, :scale => 2
    t.decimal  "est_alt_qty",        :precision => 6, :scale => 2
    t.decimal  "est_price_qty",      :precision => 6, :scale => 2
    t.decimal  "price_qty_received", :precision => 6, :scale => 2
    t.decimal  "amount_invoiced",    :precision => 6, :scale => 2
    t.string   "desc1"
    t.string   "desc2"
    t.string   "product_text1"
    t.string   "product_text2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", :id => false, :force => true do |t|
    t.string   "code"
    t.date     "po_date"
    t.integer  "warehouse_code"
    t.integer  "vendor_code"
    t.integer  "terms_code"
    t.date     "required_date"
    t.decimal  "amount_invoiced"
    t.decimal  "est_total"
    t.decimal  "est_weight"
    t.decimal  "received_total"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_id"
  end

  create_table "salespeople", :id => false, :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.date     "trans_date"
    t.time     "trans_time"
    t.string   "sequence"
    t.integer  "product_code"
    t.integer  "lot_code"
    t.decimal  "unit_cost"
    t.integer  "alt_qty"
    t.decimal  "p_qty"
    t.string   "serial"
    t.integer  "line_code"
    t.integer  "vendor_code"
    t.integer  "pallet_id"
    t.integer  "transaction_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "whse"
    t.string   "po_code"
    t.integer  "day_id"
    t.integer  "order_code"
  end

  create_table "vendors", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.decimal  "ytd_purchased"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
