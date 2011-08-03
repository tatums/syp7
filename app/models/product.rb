class Product < ActiveRecord::Base

	set_primary_key "code" 
	has_many :transactions, :class_name => "Transaction", :foreign_key => "product_code"
  has_many :orderlines, :class_name => "Orderline", :foreign_key => "product_code"
  has_many :product_histories, :class_name => "ProductHistory", :foreign_key => "product_code"
  has_many :lots, :class_name => "Lot", :foreign_key => "product_code"
  has_many :purchase_order_lines, :class_name => "PurchaseOrderLine", :foreign_key => "product_code"

  def code_and_desc1
    code.to_s + " - " + description_1.to_s
  end


  def full_desc
    code.to_s + " - " + description_1.to_s + " ,  " + description_2.to_s
  end
  



#------------------------------------------------------------------------------------
  def self.add_csv_records(file)
     require 'csv'
   	
      csv = CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true})
      csv.each do |r|
        p = Product.new
        p.active = r[0].to_i
        p.code = r[1]
        p.category_code = r[3]
        p.description_1 = r[4]
        p.description_2 = r[5]
        p.apn = r[6]
        p.psys = r[7]
        p.save
      end
  end

  #-------------------------------PAGINATE
    cattr_reader :per_page
    @@per_page = 150


end
