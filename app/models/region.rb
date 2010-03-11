class Region < ActiveRecord::Base
  has_many :cities, :dependent => :destroy
  
  validates_presence_of :name_uk
  validates_presence_of :name_ru
  
  def name
    self.send("name_#{I18n.locale}")
  end
    
end