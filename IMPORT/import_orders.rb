require 'rubygems'
require 'active_record'
require 'csv'

#Gain access to the Rails model
require '../app/models/order.rb'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :host => 'localhost',
  :database => '../db/development.sqlite3'
  )
  

@file = File.open("../../Program Files/Data Extract/Data/TS_Orders_by_Date.csv", "r")
@string = String.new

@file.each do |row|
    next if row.empty?
    @string << row.gsub(/"/, '')  
end

Order.add_csv_records(@string)