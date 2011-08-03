class AddCounterCacheToCustomersOrders < ActiveRecord::Migration
  def self.up
    add_column :customers, :orders_count, :integer, :default => 0
    add_column :customers, :product_histories_count, :integer, :default => 0

    remaining = Customer.all.count      
    puts "Setting up the existing counter cache for all #{remaining} Customer "
    Customer.reset_column_information
    
    Customer.all.each do |c|
      Customer.update_counters c.id, :orders_count => c.orders.count, :product_histories_count => c.product_histories.count
      print " #{remaining -= 1}"
    end
    puts " "
    puts "Setup for counter cache completed!!!"
    
     
    
  end

  def self.down
    remove_column :customers, :orders_count, :integer, :default => 0
    remove_column :customers, :product_histories_count, :integer, :default => 0
  end
end
