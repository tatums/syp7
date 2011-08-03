class Linecode < ActiveRecord::Base
	
	set_primary_key "code" 
	has_many :transactions, :class_name => "Transaction", :foreign_key => "line_code"


  def code_and_desc
    if description.nil?
      code.to_s
    else  
      code.to_s + " - " + description 
    end
  end


  def self.add_csv_records(file)
      require 'csv'
    	
        csv = CSV.parse(file, {:headers =>true, :col_sep => "\t", :skip_blanks => true})
        csv.each do |row|
          lc = Linecode.new
          lc.warehouse = row[0]
          lc.code = row[1]
          lc.line_type = row[2]
          lc.description = row[3]
        lc.save
        end
  end


  #-------------------------------------PAGINATE
  cattr_reader :per_page
  @@per_page = 150



end
