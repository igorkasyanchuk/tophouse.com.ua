class Region < ActiveRecord::Base
  has_many :cities, :dependent => :destroy
  
  validates_presence_of :name_uk
  validates_presence_of :name_ru
end