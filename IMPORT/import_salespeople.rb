require 'rubygems'
require 'active_record'
require 'csv'

#Gain access to the Rails model
require '../app/models/salesperson.rb'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :host => 'localhost',
  :database => '../db/development.sqlite3'
  )
  
Salesperson.delete_all

@file = File.open("../../Program Files/Data Extract/Data/TS_Salesman.csv", "r")
@string = String.new

@file.each do |row|
    next if row.empty?
    @string << row.gsub(/"/, '')  
end

Salesperson.add_csv_records(@string)