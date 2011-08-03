class AddCounterCacheToDay < ActiveRecord::Migration
  def self.up
    
    add_column :days, :purchase_orders_count, :integer, :default => 0
    add_column :days, :orders_count, :integer, :default => 0
    add_column :days, :transactions_count, :integer, :default => 0
    add_column :days, :product_histories_count, :integer, :default => 0
    
    puts "Setting up the Counter Cache for Day object"
    Day.reset_column_information
     
    remaining = Day.all.count  
    Day.all.each do |d|
      Day.update_counters d.id, :purchase_orders_count => d.purchase_orders.count, :orders_count => d.orders.count,
        :transactions_count  =>  d.transactions.count, :product_histories_count => d.product_histories.count
      print " #{remaining -= 1}"
    end
    puts "Setup for counter cache completed!!!"
  end

  def self.down
    remove_column :days, :purchase_orders_count, :integer, :default => 0
    remove_column :days, :orders_count, :integer, :default => 0
    remove_column :days, :transactions_count, :integer, :default => 0
    remove_column :days, :product_histories_count, :integer, :default => 0
  end
end
