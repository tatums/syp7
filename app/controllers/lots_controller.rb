class LotsController < ApplicationController
  def index
    if params[:day_id]
      @day = Day.find(params[:day_id])
      @lots= @day.lots.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'code DESC'
    else
  	  @lots = Lot.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'code DESC'
    end
    
    
    
  end

  def show
    
    
    @lot = Lot.find(params[:id])
    #@transactions = Transaction.where(:lot_code => params[:id]).all.paginate :page => params[:page]
    #transactions = @lot.transactions.paginate :page => params[:page]
  end

  def new
    
  end
  
  def create
  	#Lot.delete_all
    Lot.add_csv_records(params[:dump][:file].read)
    redirect_to :action => :index  
  end
  

end
