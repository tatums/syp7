class CreateAssemblers < ActiveRecord::Migration
  def self.up
    create_table :assemblers, :id => false do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :assemblers
  end
end
