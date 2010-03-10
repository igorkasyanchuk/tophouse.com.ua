class Site < ActiveRecord::Base
  validates_presence_of :dollar
  validates_presence_of :euro
  validates_numericality_of :dollar
  validates_numericality_of :euro
  
  def Site.configuration
    @configuration ||= Site.first
  end
  
  def Site.dollar
    Site.configuration.dollar / 100.0
  end
  
  def Site.euro
    Site.configuration.euro / 100.0
  end
  
  def Site.dollar_format
    "#{Site.dollar} грн"
  end
  
  def Site.euro_format
    "#{Site.euro} грн"
  end  
  
end