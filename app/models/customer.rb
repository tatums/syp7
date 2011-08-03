class Customer < ActiveRecord::Base
  	
  	set_primary_key "code" 
  	has_many :orders, :class_name => "Order", :foreign_key => "customer_code"
    has_many :product_histories, :class_name => "ProductHistory", :foreign_key => "billing_customer"

   # has_many :salespeople, :through => :salespeople, :class_name => "Salesperson", :foreign_key => "salesperson_id"

    def self.add_csv_records(file)
    	require 'csv'
      CSV.parse(file, {:headers =>true, :col_sep => "\t" }) do |row|     

        c = Customer.new
        c.code = row[0]
        c.name = row[1]
        c.address = row[2]
        c.city = row[4]
        c.state = row[5]
        c.zip = row[6]
        c.contact = row[7]
        c.phone = row[8]
        c.save
      end
    end #add_csv_records



    def self.only_names
       find(:all, :select => "name").map(&:name)  
    end 



    #-------------------------------------PAGINATE
        cattr_reader :per_page
        @@per_page = 150


end
