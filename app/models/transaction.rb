class Transaction < ActiveRecord::Base
	  belongs_to :linecode, :class_name => "Linecode", :foreign_key => "line_code"
	  belongs_to :product, :class_name => "Product", :foreign_key => "product_code"
	  belongs_to :day, :counter_cache => true

    belongs_to :lot, :class_name => "Lot", :foreign_key => "lot_code"
    belongs_to :vendor, :class_name => "Vendor", :foreign_key => "vendor_code"
    belongs_to :purchase_order, :class_name => "PurchaseOrder", :foreign_key => "po_code"


  def self.add_csv_records(file)
        require 'csv'
        csv = CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true})
        csv.each do |row|
         x = row[0].to_s
         new_date = Date.new(x[0,4].to_i, x[4,2].to_i, x[6,2].to_i) 
         new_time = Time.new(x[0,4].to_i, x[4,2].to_i, x[6,2].to_i,  x[8,2].to_i, x[10,2].to_i, 0) 
    	
    	   DayMonthYear.setup_day_month_year(new_date)
         day = Day.where(:day => new_date).first
         t = day.transactions.new
          
          t.trans_date = new_date
          t.trans_time = new_time
          t.sequence = row[3]
          t.product_code = row[4]
          t.lot_code = row[5]
          t.unit_cost = row[6]
          t.alt_qty = row[7]
          t.p_qty = row[8]
          t.serial = row[9]
          t.line_code = row[10]
          t.vendor_code = row[11]
          t.pallet_id = row[12]
          t.transaction_type = row[13]
          unless row[15].nil?
            t.po_code = row[15].strip
          end
          t.whse = row[16]
        t.save
        end
  end


  def self.unique_days
    find(:all, :select => "trans_date").map(&:trans_date).uniq  
  end

  #-------------------------------PAGINATE
    cattr_reader :per_page
    @@per_page = 150


end
