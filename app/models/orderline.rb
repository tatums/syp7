class Orderline < ActiveRecord::Base

  belongs_to :order, :class_name => "Order", :foreign_key => "order_code"
  belongs_to :product, :class_name => "Product", :foreign_key => "product_code"

  def self.add_csv_records(file) 
   	require 'csv'
  
    CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true }) do |row| 
      x = row[26].split("/")
      new_date = Date.new(x[2].to_i, x[0].to_i, x[1].to_i)
       ol = Orderline.new
  	   ol.customer_code = row[0]
       ol.default_cost = row[1]
       ol.default_price = row[2]
       ol.extended_cost = row[3]
       ol.extended_price = row[4]
       ol.line_number = row[6]
       ol.line_type = row[7]
       ol.line_weight = row[8]
       ol.order_uom = row[9]
       ol.lot_total_cost = row[10]
       ol.order_code = row[11]
       ol.override_cost = row[12]
       ol.pricing_uom = row[14]
       ol.product_code = row[15]
       ol.product_description = row[16]
       ol.qty_pricing = row[19]
       ol.qty_ordered = row[20]
       ol.unit_price = row[22]
       ol.unit_cost = row[23]
       ol.lot_qty_price = row[24]
       ol.lot_qty_alt = row[25]
       ol.order_date = new_date
       ol.save
    end
  end  

  cattr_reader :per_page
  @@per_page = 150


end
