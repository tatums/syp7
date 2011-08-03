class LinecodesController < ApplicationController
  def index
  	@linecodes = Linecode.paginate :page => params[:page], :order => 'created_at ASC'
  end

  def show
  	@linecode = Linecode.find(params[:id])
  	@transactions = @linecode.transactions.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def new
  end

  def create
	  Linecode.delete_all
    Linecode.add_csv_records(params[:dump][:file].read)
    redirect_to :action => :index  

  end

end
