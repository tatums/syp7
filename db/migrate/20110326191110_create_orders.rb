class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders, :id => false do |t|
      t.integer :code
      t.integer :status_code
      t.integer :customer_code
      t.string :status_description
      t.integer :salesperson_code
      t.integer :assembler_code
      t.integer :shipping_code
      t.string :customer_po
      t.date :order_date
      t.decimal :total_freight, :precision => 6, :scale => 2
      t.decimal :total_weight, :precision => 6, :scale => 2
      t.string :csr
      t.decimal :estimated_amount, :precision => 6, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
