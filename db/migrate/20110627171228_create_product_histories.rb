class CreateProductHistories < ActiveRecord::Migration
  def self.up
    create_table :product_histories do |t|
      t.date :trans_date
      t.integer :product_code
      t.integer :whse
      t.integer :salesperson_code
      t.integer :billing_customer
      t.string :po
      t.integer :lot
      t.string :alt_uom
      t.integer :alt_qty
      t.decimal :prc_qty, :precision => 6, :scale => 2
      t.string :prc_uom
      t.decimal :unit_cost, :precision => 6, :scale => 2
      t.decimal :unit_price, :precision => 6, :scale => 2
      t.decimal :weight, :precision => 6, :scale => 2
      t.decimal :total_cost, :precision => 6, :scale => 2
      t.decimal :total_sales, :precision => 6, :scale => 2
      t.integer :trans_type
      t.string :trans_desc
      t.integer :assembler_code
      t.integer :day_id
      t.timestamps
    end
  end

  def self.down
    drop_table :product_histories
  end
end
