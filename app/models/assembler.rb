class Assembler < ActiveRecord::Base
	set_primary_key "code" 

  
  has_many :orders, :class_name => "Order", :foreign_key => "assembler_code" 

  def self.add_csv_records(file)
  	require 'csv'
    CSV.parse(file, {:headers =>true, :col_sep => "\t" }) do |row|     
      a = Assembler.new
      a.code = row[0]
      a.name = row[1]
      a.save
    end
  end 





end
