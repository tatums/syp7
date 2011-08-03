class PurchaseOrder < ActiveRecord::Base
	set_primary_key "code" 

  has_many :line_items, :class_name => "PurchaseOrderLine", :foreign_key => "po_code"
  has_many :transactions, :class_name => "Transaction", :foreign_key => "po_code"

  belongs_to :day, :counter_cache => true
  belongs_to :vendor, :class_name => "Vendor", :foreign_key => "vendor_code"

  
  
  #-------------------------------------------------------------------------------
    def self.add_csv_records(file)
    	require 'csv'

    	CSV.parse(file, {:headers =>true, :col_sep => "\t" }) do |row|

    	  #the month and the day were swapped... This builds the date manually.
      	pod = row[0].split("/")
      	pod_date = Date.new(1900,1,1)
      	unless pod[2].to_i == 0
      	  pod_date = Date.new(pod[2].to_i, pod[0].to_i, pod[1].to_i)
        end

    	  #the month and the day were swapped... This builds the date manually.
      	req_date = Date.new(1900,1,1)
      	rqd = row[5].split("/")
      	unless rqd[2].to_i == 0
      	  req_date = Date.new(rqd[2].to_i, rqd[0].to_i, rqd[1].to_i)
        end
        DayMonthYear.setup_day_month_year(req_date)
        day = Day.where(:day => req_date).first
        po = day.purchase_orders.new

        po.code = row[1].strip!
        po.po_date = pod_date
        po.warehouse_code = row[2]
        po.vendor_code = row[3]
        po.terms_code = row[4]
        po.required_date = req_date
        po.amount_invoiced = row[6]
        po.est_total = row[7]
        po.est_weight = row[8]
        po.received_total = row[9]
        po.status = row[10]
        po.save
      end
    end
  #-------------------------------------------------------------------------------
    
  


  cattr_reader :per_page
  @@per_page = 150


end
