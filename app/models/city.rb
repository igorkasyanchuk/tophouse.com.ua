class City < ActiveRecord::Base
  include TopHouseGeneral
  
  default_scope :include => :region
  named_scope :top_cities, :conditions => { :top_city => true }
  
  add_default_orders
  
  belongs_to :region
  
  has_many :companies
  has_many :agents
  has_many :rieltors
  has_many :garages
  
  validates_presence_of :name_uk
  validates_presence_of :name_ru
  validates_presence_of :region_id
    
end