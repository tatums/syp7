class RenameProductHistoriesLotToLotCode < ActiveRecord::Migration
  def self.up
    rename_column :product_histories, :lot, :lot_code
  end

  def self.down
    rename_column :product_histories, :lot_code, :lot
  end
end
