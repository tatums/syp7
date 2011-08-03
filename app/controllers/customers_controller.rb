class CustomersController < ApplicationController
  def index
  	@customers = Customer.paginate :page => params[:page]
  end

  def upload
  end
  
  def new
  end
  
  def show
  	@customer = Customer.find(params[:id])
  end	

  def create
    Customer.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Customer.add_csv_records(@string)
    redirect_to :action => :index  
  end #create

end
