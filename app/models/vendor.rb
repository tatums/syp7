class Vendor < ActiveRecord::Base

  set_primary_key "code"

  has_many :transactions, :class_name => "Transaction", :foreign_key => "vendor_code"
  has_many :purchase_orders, :class_name => "PurchaseOrder", :foreign_key => "vendor_code"
  
  
  def code_and_name
      if code.nil? or name.nil? 
        puts " "
      else  
        code.to_s + " - " + name 
      end
  end
  
  

  def self.add_csv_records(file)
        require 'csv'
      	
        csv = CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true})
        csv.each do |row|
          v = Vendor.new
          v.code = row[0]
          v.name = row[1]
          v.address_1 = row[2]
          v.address_2 = row[3]
          v.city = row[4]
          v.state = row[5]
          v.zip_code = row[6]
          v.phone = row[7]
          v.ytd_purchased = row[8]
          v.save
        end
  end

  cattr_reader :per_page
  @@per_page = 150



end
