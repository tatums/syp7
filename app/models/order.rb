class Order < ActiveRecord::Base
	set_primary_key "code" 

	cattr_reader :per_page
  @@per_page = 50
	
	  has_many :orderlines, :class_name => "Orderline", :foreign_key => "order_code", :dependent => :destroy	  
	  belongs_to :day, :counter_cache => true
	  belongs_to :salesperson, :class_name => "Salesperson", :foreign_key => "salesperson_code"
	  belongs_to :customer, :class_name => "Customer", :foreign_key => "customer_code", :counter_cache => true
	  belongs_to :assembler, :class_name => "Assembler", :foreign_key => "assembler_code"

	  #named_scope :recent, lambda { |*args| {:conditions => ["created_at > ?", (args.first || 2.weeks.ago).to_s(:db)]} }
	scope :descending, :order => "order_date DESC"
	scope :ascending, :order => "order_date ASC"
	  	 
	      
  def self.add_csv_records(file)
      require 'csv'
    
      CSV.parse(file, {:headers =>true, :col_sep => "\t" }) do |row|
          #the month and the day were swapped... This builds the date manually.
          x = row[1].split("/")
          @new_date = Date.new(x[2].to_i, x[0].to_i, x[1].to_i)
      
          DayMonthYear.setup_day_month_year(@new_date)
          day = Day.where(:day => @new_date).first
                
          o = day.orders.new
          o.code = row[0]
          o.order_date = @new_date
          o.status_code = row[2]
          o.status_description = row[3]
          o.customer_code = row[4]
          o.salesperson_code = row[5]
          o.assembler_code = row[6]
          o.shipping_code = row[7]
          o.customer_po = row[8]
          o.csr = row[9]
          o.estimated_amount = row[10]
          o.save
      end

      day = Day.where(:day => @new_date).first
      
      day.calculate_sales_costs_profit
      # day.calculate_gross_sales
      # day.calculate_gross_cost
      # day.calculate_net_profit
      day.month.calculate_sales_costs_profit
      # day.month.calculate_gross_sales
      # day.month.calculate_gross_cost
      # day.month.calculate_net_profit
  end
    
    
	  
	  def price_sub_total   
      orderlines.map { |i| i.extended_price }.sum
    end
    
	  def cost_sub_total   
      orderlines.map { |i| i.extended_cost }.sum
    end
    
    def profit_margin
      price_sub_total - cost_sub_total
    end  
   
    def self.all_orders_only_id
      select('orders.order_id').map(&:order_id)  
    end  
    


    def self.unique_days
      select('orders.order_date').map(&:order_date).uniq
    end

    
    
    
    def self.gross_sales
      select('gross_sales, day, orders_count').where('orders_count > 0').order('day ASC').map{|s| s.gross_sales.to_i }
    end
    
    
    def self.calculate_assembler_tonage(assembler)
      assembler_tonage = 0 
      orders = where(:assembler_code => assembler)
      orders.each do |order|
        assembler_tonage += order.orderlines.map { |i| i.extended_price }.sum
      end
      return assembler_tonage
    end
    


#-------------------------------------PAGINATE
    cattr_reader :per_page
    @@per_page = 150



end
