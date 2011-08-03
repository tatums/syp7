class ProductHistoriesController < ApplicationController
  def index
    case 
      when params[:product_id]
        @product = Product.find(params[:product_id])
        @product_histories = @product.product_histories.order("trans_date DESC").paginate :page => params[:page]   
      when params[:customer_id]
        @customer = Customer.find(params[:customer_id])
        @product_histories = @customer.product_histories.order("trans_date DESC").paginate :page => params[:page]   
      when params[:day_id]
        @day = Day.find(params[:day_id])
        @product_histories = @day.product_histories.order("trans_date DESC").paginate :page => params[:page]   
      when params[:lot_id]
        @lot = Lot.find(params[:lot_id])
        @product_histories = @lot.product_histories.order("trans_date DESC").paginate :page => params[:page]   
      else
        @product_histories = ProductHistory.paginate :page => params[:page]         
    end  
  end

  def show
  end

  def new
  end

  def create
    #ProductHistory.delete_all
    #setup_file_and_remove_quotes(params[:dump][:file].read)  
    ProductHistory.add_csv_records(params[:dump][:file].read)
    redirect_to :action => :index  
  	
  end

end
