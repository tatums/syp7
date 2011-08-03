class CreateSalespeople < ActiveRecord::Migration
  def self.up
    create_table :salespeople, :id => false do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :salespeople
  end
end
