class RenameMonthsYearToYearId < ActiveRecord::Migration
  def self.up
    rename_column :months, :year, :year_id
    rename_column :days, :month, :month_id
    add_column :orders, :day_id, :integer
  end

  def self.down
    rename_column :months, :year_id, :year
    rename_column :days, :month_id, :month
    remove_column :orders, :day_id, :integer
  end
end
