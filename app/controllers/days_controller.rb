class DaysController < ApplicationController
  def index
    
    
    if params[:month_id]
      @month = Month.find(params[:month_id])
      @days = @month.days.order(sort_column2 + ' ' + sort_direction).paginate :page => params[:page]

      @chart = LazyHighCharts::HighChart.new('chart') do |f|
        f.series(:name => 'Sales', :data=> @month.days.gross_sales)
        f.series(:name=>'Cost', :data=> @month.days.gross_cost)
        f.options[:title][:text] = " "
        f.options[:x_axis][:categories] = @month.days.only_days
        f.options[:chart][:defaultSeriesType] = "area"
        f.options[:chart][:backgroundColor] = '#FFF'
        f.options[:chart][:shadow] = true
        #f.options[:x_axis][:labels][:rotation] = 45 
      end

    else
      @days = Day.order(sort_column2 + ' ' + sort_direction).paginate :page => params[:page]
    end  

    
    
  end

  def show
    @day = Day.find(params[:id])
  end

end
