class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method  :setup_file_and_remove_quotes

  helper_method :sort_column, :sort_direction 

  

  def setup_file_and_remove_quotes(file)
    @string = file
    @string.gsub!(/"/, '')        
  end  

  private  
        def sort_column  
          params[:sort] || "code"  
        end  
        def sort_column2  
          params[:sort] || "day"  
        end  

        def sort_direction  
          params[:direction] || "asc"  
        end



end
