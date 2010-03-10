class Garage < ActiveRecord::Base
  include ::TopHouse
  
  enumeration_for :adv_type, ADV_TYPES, :single => true
  enumeration_for :i_am_type, I_AM_TYPES, :single => true
  enumeration_for :currency_id, CURRENCIES, :single => true
  
  belongs_to :city
  belongs_to :region
  belongs_to :user
  has_many :photos, :as => :photable
  
  validates_presence_of :title
  validates_presence_of :adv_text
  
  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes.any? {|k,v| v.blank? } } 
  
  def uuid
    "##{self.id}"
  end
  
end