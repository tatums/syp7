class PurchaseOrderLinesController < ApplicationController
  def index
      @purchase_order_lines = PurchaseOrderLine.all.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def show
  end

  def new
  end

  def create
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    PurchaseOrderLine.add_csv_records(@string)
    redirect_to :action => :index      
  end

end
