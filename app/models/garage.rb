class Garage < ActiveRecord::Base
  include ::TopHouse
  include ::TopHouseUtilities
  
  init_top_house
  
end