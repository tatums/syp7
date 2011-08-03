class MonthsController < ApplicationController
  def index
    if params[:year_id]
      @year = Year.find(params[:year_id])
      @months = @year.months.order("month ASC")
    else
      @year = Year.where(Time.now.year).first
      @months = Month.order("month ASC")
    end  
    
    
    
    @chart = LazyHighCharts::HighChart.new('chart') do |f|
      f.series(:name => 'Sales', :data=> @year.months.gross_sales)
      f.series(:name=>'Cost', :data=> @year.months.gross_cost)
        f.options[:title][:text] = " "
        f.options[:x_axis][:categories] = @year.months.only_months_names
        f.options[:chart][:defaultSeriesType] = "area"
        f.options[:chart][:backgroundColor]= '#FFF'
        f.options[:chart][:shadow] = true
    end
    
    
  end

  def show
  end

end
