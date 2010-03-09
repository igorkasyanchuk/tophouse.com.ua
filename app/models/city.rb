class City < ActiveRecord::Base
  belongs_to :region
  has_many :companies
  has_many :agents
  has_many :rieltors
  
  validates_presence_of :name_uk
  validates_presence_of :name_ru
  validates_presence_of :region_id
end