class TransactionsController < ApplicationController
  
  helper_method :sort_column, :sort_direction 
  
  def index
    case 
    when params[:day_id]
      @day = Day.find(params[:day_id])
      @transactions = @day.transactions.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'id ASC'
    when params[:product_id]  
      @product = Product.find(params[:product_id])
      @transactions = @product.transactions.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'id ASC'
    when params[:lot_id]  
      @lot = Lot.find(params[:lot_id])
      @transactions = @lot.transactions.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'id ASC'
    when params[:vendor_id]  
      @vendor = Vendor.find(params[:vendor_id])
      @transactions = @vendor.transactions.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'id ASC'
    else
      @transactions = Transaction.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'id ASC'
    end
   
  end
  
  def show
    @transaction = Transaction.find(params[:id])
  end
  
  def new
  end

  def create
    Transaction.add_csv_records(params[:dump][:file].read) 
    redirect_to :action => :index  
    #setup_days_for_transactions
    
  end #create

private  
        def sort_column  
          params[:sort] || "trans_date"  
        end  

        def sort_direction  
          params[:direction] || "asc"  
        end




end
