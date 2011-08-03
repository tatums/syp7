require 'rubygems'
require 'active_record'
require 'csv'

#Gain access to the Rails model
require '../app/models/orderline.rb'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :host => 'localhost',
  :database => '../db/development.sqlite3'
  )
  



#Orderline.delete_all

@file = File.open("../../Program Files/Data Extract/Data/TS_OrderLines_by_Order_Date.csv", "r")
@string = String.new

@file.each do |row|
    next if row.empty?
    @string << row.gsub(/"/, '')  
end

Orderline.add_csv_records(@string)
