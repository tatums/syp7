class OrdersController < ApplicationController


  def index
    
    case 
    when params[:day_id]
      @day = Day.find(params[:day_id])
      @orders= @day.orders.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'order_date DESC'
    when params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders= @customer.orders.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'order_date DESC'
    else
  	  @orders = Order.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'order_date DESC'
    end

  end

  def new
  end
  
  def show
  	@order = Order.find(params[:id])
  	@orderlines = @order.orderlines
  end




  def create

    #Order.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Order.add_csv_records(@string)
    #setup_days_for_orders
    redirect_to :action => :index  
    
  end
  
  


end
