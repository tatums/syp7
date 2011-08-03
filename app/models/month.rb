class Month < ActiveRecord::Base
  def to_param
    "#{month.to_s.gsub(/\W/, '-').downcase}"
  end


  belongs_to :year
  has_many :days
  
  def self.unique_months
    select('months.month').map(&:month).uniq
  end

  def self.only_months
     select('month').order('month ASC').map(&:month)
  end
  
  def self.only_months_names
    select('month').order('month ASC').map{ |m| Date::MONTHNAMES[m.month] }
  end

  def self.gross_sales
    select('gross_sales, month').order('month ASC').map{|s| s.gross_sales.to_i }
  end
  def self.gross_cost
    select('gross_cost, month').order('month ASC').map{ |c| c.gross_cost.to_i }
  end
  # def self.gross_sales
  #   select('gross_sales').map(&:gross_sales)
  # end
  

  
  
  
  def formatted_month
    Date::MONTHNAMES[month] 
  end


#protected
#-------------------------------------------------------  
  def calculate_gross_sales   
    month_gross_sales = 0
    days.each do |day|
      month_gross_sales += day.gross_sales  
    end  
    self.update_attribute(:gross_sales, month_gross_sales)
  end
  
  def calculate_gross_cost   
    month_gross_cost = 0
    days.each do |day|
      month_gross_cost += day.gross_cost  
    end  
    self.update_attribute(:gross_cost, month_gross_cost)
  end

  def calculate_net_profit   
    month_net_profit = 0
    days.each do |day|
      month_net_profit += day.net_profit  
    end  
    self.update_attribute(:net_profit, month_net_profit)
  end
  
  def calculate_sales_costs_profit
    month_gross_sales = 0
    month_gross_cost = 0
    month_net_profit = 0
    days.each do |day|
      month_gross_sales += day.gross_sales
      month_gross_cost += day.gross_cost 
      month_net_profit += day.net_profit     
    end  
    self.update_attribute(:gross_sales, month_gross_sales)
    self.update_attribute(:gross_cost, month_gross_cost)
    self.update_attribute(:net_profit, month_net_profit)
  end
  
#-------------------------------------------------------
  def self.calculate_all_monthly_sales
    remaining = Month.all.count 
    Month.all.each do |month|
      month.calculate_gross_sales
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
  end

  def self.calculate_all_monthly_cost
    remaining = Month.all.count 
    Month.all.each do |month|
      month.calculate_gross_cost
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
  end

  def self.calculate_all_monthly_profit
    remaining = Month.all.count 
    Month.all.each do |month|
      month.calculate_net_profit
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
  end
  
  def reset_totals
    self.gross_sales = 0 
    self.gross_cost = 0 
    self.net_profit = 0
    self.save
  end
  
  
  # def selft.year_total
  #     order.orderlines.map {|ol| ol.extended_price}.sum
  # end
  
  
  
  
  
end
