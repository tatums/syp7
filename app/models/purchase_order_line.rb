class PurchaseOrderLine < ActiveRecord::Base

  belongs_to :product, :class_name  => "Product", :foreign_key => "product_code"


  #-------------------------------------------------------------------------------
    def self.add_csv_records(file)
    	require 'csv'

    	CSV.parse(file, {:headers =>true, :col_sep => "\t" }) do |row|

    	  #the month and the day were swapped... This builds the date manually.
      	pod = row[6].split("/")
      	rec_date = Date.new(1900,1,1)
      	unless pod[2].to_i == 0
      	  rec_date = Date.new(pod[2].to_i, pod[0].to_i, pod[1].to_i)
        end

        PurchaseOrderLine.create(:po_code => row[0].strip!, :product_code  => row[1], :record_type => row[2], 
          :order_qty => row[3], :order_uom => row[4], :pricing_uom => row[5], :receipt_date => rec_date, :unit_price => row[7],
          :est_weight => row[8], :weight_received => row[9], :alt_qty_received => row[10], :est_alt_qty => row[11], 
          :est_price_qty => row[12], :price_qty_received => row[13], :amount_invoiced => row[14], :desc1 => row[15], 
          :desc2 => row[16], :product_text1 => row[17], :product_text2 => row[18] )
      end
    end
  #-------------------------------------------------------------------------------


    cattr_reader :per_page
    @@per_page = 150


end
