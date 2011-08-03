class DayMonthYear
  
  #This method is responsible for setting up the Day, Month and Year of any given Date that is passed to it.
  def self.setup_day_month_year(new_date)
    if Day.only_days.include?(new_date)
      day = Day.where(:day => new_date).first
    else
      if Year.unique_years.include?(new_date.year)
        yr = Year.where(:year => new_date.year).first
      else
        yr = Year.create(:year =>new_date.year)
      end  
      if Month.unique_months.include?(new_date.month)
        mnth = yr.months.where(:month => new_date.month).first        
      else
        mnth = yr.months.create(:month => new_date.month)
      end
      day = mnth.days.create(:day => new_date)
    end
  end
  
  
end