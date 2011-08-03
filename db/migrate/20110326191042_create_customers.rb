class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers, :id => false do |t|
      t.integer :code
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :contact
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
