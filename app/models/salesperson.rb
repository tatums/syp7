class Salesperson < ActiveRecord::Base
	set_primary_key "code" 	  
	has_many :orders, :class_name => "Order", :foreign_key => "salesperson_code"
	has_many :product_history, :class_name => "ProductHistory", :foreign_key => "salesperson_code"
	
	#has_many :customers, :through => :orders, :class_name => "Customer", :foreign_key => "customer_id"
  
  def self.only_names
     find(:all, :select => "name").map(&:name)  
  end 
  
  def full_name
    name.to_s
  end
  
  
  
  def self.add_csv_records(file)
        require 'csv'
      	
        csv = CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true})
        csv.each do |row|
          s = Salesperson.new
          s.code = row[0]
          s.name = row[1]
        s.save
        end
  end

  cattr_reader :per_page
  @@per_page = 150


end
