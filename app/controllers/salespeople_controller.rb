class SalespeopleController < ApplicationController
  def index
  	@salespeople = Salesperson.paginate :page => params[:page]
  end
  
  def new
  end
  
  def show
  	@salesperson = Salesperson.find(params[:id])
  	@orders = @salesperson.orders.paginate :page => params[:page], :order => 'order_date DESC'
  end	


  def create        
    Salesperson.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Salesperson.add_csv_records(@string)
    redirect_to :action => :index  
  end


  

end
