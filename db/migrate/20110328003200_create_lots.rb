class CreateLots < ActiveRecord::Migration
  def self.up
    create_table :lots, :id => false do |t|
      t.date :date
      t.integer :code
      t.integer :transaction_code
      t.integer :product_code
      t.integer :available_qty
      t.string :price_uom
      t.string :alt_uom
      t.decimal :available_price
      t.integer :pallet_code

      t.timestamps
    end
  end

  def self.down
    drop_table :lots
  end
end
