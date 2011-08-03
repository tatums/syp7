require 'rubygems'
require 'active_record'
require 'csv'

#Gain access to the Rails model
require '../app/models/transaction.rb'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :host => 'localhost',
  :database => '../db/development.sqlite3'
  )
  
@file = File.open("../../Program Files/Data Extract/Data/SYP_Transactions_by_Date.csv", "r")
@string = String.new

@file.each do |row|
    next if row.empty?
    @string << row.gsub(/"/, '')  
end

Transaction.add_csv_records(@string)