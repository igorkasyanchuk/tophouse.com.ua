class Garage < ActiveRecord::Base
  enumeration_for :adv_type, ADV_TYPES, :single => true
  belongs_to :city
  belongs_to :region
end