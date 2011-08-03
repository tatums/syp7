class VendorsController < ApplicationController
  def index
    @vendors = Vendor.paginate :page => params[:page]
  end

  def show
    @vendor = Vendor.find(params[:id])
    @transactions = @vendor.transactions.paginate :page => params[:page]
  end

  def new
  end

  def create
    Vendor.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Vendor.add_csv_records(@string)
    redirect_to :action => :index  
  end

end
