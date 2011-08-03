class CreatePurchaseOrderLines < ActiveRecord::Migration
  def self.up
    create_table :purchase_order_lines do |t|
      t.string :po_code
      t.integer :product_code
      t.integer :record_type
      t.decimal :order_qty, :precision => 6, :scale => 2
      t.string :order_uom
      t.string :pricing_uom
      t.date :receipt_date
      t.decimal :unit_price, :precision => 6, :scale => 2
      t.decimal :est_weight, :precision => 6, :scale => 2
      t.decimal :weight_received, :precision => 6, :scale => 2
      t.decimal :alt_qty_received, :precision => 6, :scale => 2
      t.decimal :est_alt_qty, :precision => 6, :scale => 2
      t.decimal :est_price_qty, :precision => 6, :scale => 2
      t.decimal :price_qty_received, :precision => 6, :scale => 2
      t.decimal :amount_invoiced, :precision => 6, :scale => 2
      t.string :desc1
      t.string :desc2
      t.string :product_text1
      t.string :product_text2

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_order_lines
  end
end
