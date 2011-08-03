class PurchaseOrdersController < ApplicationController
  
  
  
  def index
    
    case 
      when params[:day_id]
        @day = Day.find(params[:day_id])
        @purchase_orders= @day.purchase_orders.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'required_date DESC'
      when params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        @purchase_orders= @vendor.purchase_orders.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'required_date DESC'
      else
        @purchase_orders = PurchaseOrder.order(sort_column + ' ' + sort_direction).paginate :page => params[:page], :order => 'required_date DESC'
    end    
  end

  
  
  def show
      @purchase_order = PurchaseOrder.find(params[:id])
      @purchase_order_lines = @purchase_order.line_items
      @transactions = @purchase_order.transactions.paginate :page => params[:page]
  end

  def new
  end

  def create
    PurchaseOrder.add_csv_records(params[:dump][:file].read)
    redirect_to :action => :index  
  end





end
