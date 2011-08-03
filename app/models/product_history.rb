class ProductHistory < ActiveRecord::Base
  belongs_to :day, :counter_cache => true
  belongs_to :salesperson, :class_name => "Salesperson", :foreign_key => "salesperson_code"
  belongs_to :product, :class_name => "Product", :foreign_key => "product_code"
  belongs_to :customer, :class_name => "Customer", :foreign_key => "billing_customer"
  belongs_to :lot, :class_name => "Lot", :foreign_key => "lot_code"


  scope :sold, where(:trans_type => 1)
  scope :sold1, where(:trans_type => 10) 
  scope :credit1, where(:trans_type => 20)
  scope :credit2, where(:trans_type => 21)
  scope :received, where(:trans_type => 30)
  scope :formula_received, where(:trans_type => 31) 
  scope :transfered, where(:trans_type => 32) 
  scope :physical_inv_adj, where(:trans_type => 90) 


  def self.add_csv_records(file)
    require 'csv'

    CSV.parse(file, {:headers =>true, :col_sep => "\t" }) do |row|
    #the month and the day were swapped... This builds the date manually.
    x = row[0].split("/")
    new_date = Date.new(x[2].to_i, x[0].to_i, x[1].to_i)
  
    DayMonthYear.setup_day_month_year(new_date)
    day = Day.where(:day => new_date).first
    
    ph = day.product_histories.new
      ph.trans_date = new_date
      ph.product_code = row[1]
      ph.whse = row[2]
      ph.salesperson_code = row[3]
      ph.billing_customer = row[4]
      ph.po = row[5]
      ph.lot_code = row[6]
      ph.alt_uom = row[7]
      ph.alt_qty = row[8]
      ph.prc_qty = row[9]
      ph.prc_uom = row[10]
      ph.unit_cost = row[11]
      ph.unit_price = row[12]
      ph.weight = row[13]
      ph.total_cost = row[14]
      ph.total_sales = row[15]
      ph.trans_type = row[16]
      ph.trans_desc = row[17]
      ph.assembler_code = row[18]      
    ph.save
    end
  end


  def self.only_tans_type_uniq
    select(:trans_type).map(&:trans_type).uniq  
  end


end
