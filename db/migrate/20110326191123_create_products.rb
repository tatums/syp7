class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products, :id => false do |t|
      t.integer :code
      t.string :description_1
      t.string :description_2
      t.boolean :active
      t.integer :category_code
      t.string :apn
      t.string :psys

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
