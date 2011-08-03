class CreateOrderlines < ActiveRecord::Migration
  def self.up
    create_table :orderlines, :id => false do |t|
      t.integer :customer_code
      t.decimal :default_cost, :precision => 6, :scale => 2
      t.decimal :default_price, :precision => 6, :scale => 2
      t.decimal :extended_cost, :precision => 6, :scale => 2
      t.decimal :extended_price, :precision => 6, :scale => 2
      t.integer :line_number
      t.integer :line_type
      t.decimal :line_weight, :precision => 6, :scale => 2
      t.string :order_uom
      t.decimal :lot_total_cost, :precision => 6, :scale => 2
      t.integer :order_code
      t.decimal :override_cost, :precision => 6, :scale => 2
      t.string :pricing_uom
      t.string :product_code
      t.string :product_description
      t.decimal :qty_pricing, :precision => 6, :scale => 2
      t.decimal :qty_ordered, :precision => 6, :scale => 2
      t.decimal :unit_price, :precision => 6, :scale => 2
      t.decimal :unit_cost, :precision => 6, :scale => 2
      t.decimal :lot_qty_price, :precision => 6, :scale => 2
      t.decimal :lot_qty_alt, :precision => 6, :scale => 2
      t.date :order_date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :orderlines
  end
end
