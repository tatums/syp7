class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.date :trans_date
      t.time :trans_time
      t.string :sequence
      t.integer :product_code
      t.integer :lot_code
      t.decimal :unit_cost, :precision => 6, :scale => 2
      t.integer :alt_qty
      t.decimal :p_qty, :precision => 6, :scale => 2
      t.string :serial
      t.integer :line_code
      t.integer :vendor_code
      t.integer :pallet_id
      t.integer :transaction_type

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
