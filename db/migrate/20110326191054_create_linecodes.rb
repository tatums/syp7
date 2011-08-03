class CreateLinecodes < ActiveRecord::Migration
  def self.up
    create_table :linecodes, :id => false do |t|
      t.integer :code
      t.integer :warehouse
      t.integer :line_type
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :linecodes
  end
end
