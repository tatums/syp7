class Lot < ActiveRecord::Base
  set_primary_key "code"
  
  has_many :transactions, :class_name => "Transaction", :foreign_key => "lot_code"
  has_many :product_histories, :class_name => "ProductHistory", :foreign_key => "lot_code"
	belongs_to :day, :class_name => "Day", :foreign_key => "date"
  belongs_to :product, :class_name => "Product", :foreign_key => "product_code"

  def self.add_csv_records(file)
     require 'csv'
   	
        csv = CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true})
        csv.each do |row|
        x = row[0].split("/")
    		new_date = Date.new(x[2].to_i, x[0].to_i, x[1].to_i)
    	  
    	  DayMonthYear.setup_day_month_year(new_date)
      
    	
          l = Lot.new
          l.date = new_date
          l.code = row[1]
          l.transaction_code = row[2]
          l.product_code = row[3].to_i
          l.available_qty = row[4]
          l.price_uom = row[5]
          l.alt_uom = row[6]
          l.available_price = row[7]
          l.pallet_code = row[8]
          l.save
        end
  end

  def self.unique_days
    find(:all, :select => "date").map(&:date).uniq  
  end


  #-------------------------------------PAGINATE
      cattr_reader :per_page
      @@per_page = 150

end
