def setup_day_month_year(new_date)
  if Day.only_days.include?(new_date)
    day = Day.where(:day => new_date).first
  else
    if Year.unique_years.include?(:year => x[2].to_i)
      yr = Year.where(:year => x[2].to_i).first
    else
      yr = Year.create(:year => x[2].to_i)
    end  
    if Month.unique_months.include?(:month => x[0].to_i)
      mnth = yr.months.where(:month => x[0].to_i).first        
    else
      mnth = yr.months.create(:month => x[0].to_i)
    end
    day = mnth.days.create(:day => new_date)
  end
  return day   
end
