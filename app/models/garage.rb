class Garage < ActiveRecord::Base
  include ::TopHouse
  include ::TopHouseUtilities
  include ::TopHouseGeneral
  
  init_top_house
  
end