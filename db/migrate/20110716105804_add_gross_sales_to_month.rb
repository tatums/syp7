class AddGrossSalesToMonth < ActiveRecord::Migration
  def self.up
    rename_column :days, :sales_total, :gross_sales
    add_column :months, :gross_sales, :decimal, :precision => 6, :scale => 2, :default => 0
    add_column :days, :gross_cost, :decimal, :precision => 6, :scale => 2, :default => 0

    remaining = Month.all.count 
    Month.all.each do |month|
      month.calculate_gross_sales
      print " #{remaining -= 1}"
    end
    puts "Done!!!"  
    
  end

  def self.down
    rename_column :days, :gross_sales, :sales_total
    remove_column :months, :gross_sales, :decimal
    remove_column :days, :gross_cost, :decimal
    
  end
end
