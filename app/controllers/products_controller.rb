class ProductsController < ApplicationController
  def index
  	@products = Product.paginate :page => params[:page]
  end

  def show
  	@product = Product.find(params[:id])
  	#@transactions = @product.transactions.paginate :page => params[:page]
  end

  def new
  end

  def create
  	Product.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Product.add_csv_records(@string)
    redirect_to :action => :index  
  end

  private  
        def sort_column  
          params[:sort] || "code"  
        end  

        def sort_direction  
          params[:direction] || "asc"  
        end


end
