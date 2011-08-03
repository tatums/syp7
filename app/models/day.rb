class Day < ActiveRecord::Base


  has_many :orders
  has_many :transactions
  has_many :purchase_orders
  has_many :product_histories
  has_many :lots, :class_name => "Lot", :foreign_key => "date"

  belongs_to :month



  def self.only_days
    select(:day).map(&:day)  
  end

  def self.gross_sales
    select('gross_sales, day, orders_count').where('orders_count > 0').order('day ASC').map{|s| s.gross_sales.to_i }
  end

  def self.gross_cost
    select('gross_cost, day, orders_count').where('orders_count > 0').order('day ASC').map{|s| s.gross_cost.to_i }
  end

  def self.only_days
    select('day').order('day ASC').map(&:day)
  end



#protected
#----------------------------------------------------
  # def calculate_gross_sales   
  #   day_gross_sales = 0
  #   orders.each do |order|
  #     order_total = order.orderlines.map {|ol| ol.extended_price}.sum
  #     day_gross_sales += order_total
  #   end  
  #   self.update_attribute(:gross_sales, day_gross_sales)
  # end
  # 
  # def calculate_gross_cost   
  #   day_gross_cost = 0
  #   orders.each do |order|
  #     order_cost_total = order.orderlines.map {|ol| ol.extended_cost}.sum
  #     day_gross_cost += order_cost_total
  #   end  
  #   self.update_attribute(:gross_cost, day_gross_cost)
  # end
  # 
  # def calculate_net_profit   
  #   day_net_profit = gross_sales - gross_cost
  #   self.update_attribute(:net_profit, day_net_profit)
  # end
  
  def calculate_sales_costs_profit   
    day_gross_sales = 0
    day_gross_cost = 0
    orders.each do |order|
      order_total = order.orderlines.map {|ol| ol.extended_price}.sum
      order_cost_total = order.orderlines.map {|ol| ol.extended_cost}.sum
      day_gross_sales += order_total
      day_gross_cost += order_cost_total
    end  
    self.update_attribute(:gross_sales, day_gross_sales)
    self.update_attribute(:gross_cost, day_gross_cost)
    day_net_profit = gross_sales - gross_cost
    self.update_attribute(:net_profit, day_net_profit)
  end
  
#-----------------------------------------------------
  def self.calculate_all_days_sales
    remaining = Day.all.count 
    Day.all.each do |day|
      day.calculate_gross_sales
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
  end

  def self.calculate_all_days_cost
    remaining = Day.all.count 
    Day.all.each do |day|
      day.calculate_gross_cost
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
  end

  def self.calculate_all_days_profit
    remaining = Day.all.count 
    Day.all.each do |day|
      day.calculate_net_profit
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
  end

  def reset_totals
    self.orders_count = 0
    self.gross_sales = 0 
    self.gross_cost = 0 
    self.net_profit = 0
    self.save
  end





end
