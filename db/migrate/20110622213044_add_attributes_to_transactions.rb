class AddAttributesToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :whse, :integer
    add_column :transactions, :po_code, :string
    add_column :transactions, :day_id, :integer
    add_column :transactions, :order_code, :integer
    add_column :purchase_orders, :day_id, :integer
  end

  def self.down
    remove_column :transactions, :whse, :integer
    remove_column :transactions, :po_code, :string
    remove_column :transactions, :day_id, :integer
    remove_column :transactions, :order_code, :integer
    remove_column :purchase_orders, :day_id, :integer
  end
end
