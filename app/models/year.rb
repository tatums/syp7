class Year < ActiveRecord::Base
  def to_param
    "#{id}-#{year.to_s.gsub(/\W/, '-').downcase}"
  end

  has_many :months
  
  def self.unique_years
    select('years.year').map(&:year).uniq
  end
  
end
