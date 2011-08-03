class OrderlinesController < ApplicationController
  def index
    @orderlines = Orderline.paginate :page => params[:page], :order => 'order_date DESC'
  end
  
  def new
  end

  def create


    Orderline.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Orderline.add_csv_records(@string)
    redirect_to :action => :index  

  end #create
   


end
