class AddSalesTotalToDay < ActiveRecord::Migration
  def self.up
    add_column :days, :sales_total, :decimal, :precision => 6, :scale => 2, :default => 0


      remaining = Day.all.count 
      Day.all.each do |day|
        day.calculate_gross_sales
        print " #{remaining -= 1}"
      end
      puts "Done!!!"  
      
  end

  def self.down
    remove_column :days, :sales_total, :decimal
  end
end
