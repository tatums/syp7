class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.integer :code
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.decimal :ytd_purchased

      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
