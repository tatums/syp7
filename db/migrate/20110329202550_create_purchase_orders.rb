class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders, :id => false do |t|
      t.string :code
      t.date :po_date
      t.integer :warehouse_code
      t.integer :vendor_code
      t.integer :terms_code
      t.date :required_date
      t.decimal :amount_invoiced
      t.decimal :est_total
      t.decimal :est_weight
      t.decimal :received_total
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_orders
  end
end
