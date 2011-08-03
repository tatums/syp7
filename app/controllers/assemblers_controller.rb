class AssemblersController < ApplicationController
  def index
    @assemblers = Assembler.paginate :page => params[:page]
  end

  def show
    @assembler = Assembler.find(params[:id])
  end

  def new
  end

  def create
    Assembler.delete_all
    setup_file_and_remove_quotes(params[:dump][:file].read)  
    Assembler.add_csv_records(@string)
    redirect_to :action => :index  
  end

end
