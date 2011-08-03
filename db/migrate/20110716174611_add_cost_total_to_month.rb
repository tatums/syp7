class AddCostTotalToMonth < ActiveRecord::Migration
  def self.up
    add_column :months, :gross_cost, :decimal, :precision => 6, :scale => 2, :default => 0
    add_column :months, :net_profit, :decimal, :precision => 6, :scale => 2, :default => 0
    add_column :days, :net_profit, :decimal, :precision => 6, :scale => 2, :default => 0
    
  end

  def self.down
    remove_column :months, :gross_cost, :decimal
    remove_column :months, :net_profit, :decimal
    remove_column :days, :net_profit, :decimal
  end
end
