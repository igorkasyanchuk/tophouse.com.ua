module TopHouse
  
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
  
  module ClassMethods
    
    def init_top_house
      enumeration_for :adv_type, ADV_TYPES, :single => true
      enumeration_for :i_am_type, I_AM_TYPES, :single => true
      enumeration_for :currency_id, CURRENCIES, :single => true
      
      named_scope :sell, :conditions => { :adv_type => enumeration_attribute_db_value(:adv_type, ADV_TYPE_SELL) }
      named_scope :buy, :conditions => { :adv_type => enumeration_attribute_db_value(:adv_type, ADV_TYPE_BUY) }
      named_scope :rent, :conditions => { :adv_type => enumeration_attribute_db_value(:adv_type, ADV_TYPE_RENT) }
      named_scope :give, :conditions => { :adv_type => enumeration_attribute_db_value(:adv_type, ADV_TYPE_GIVE) }
      
      belongs_to :city
      belongs_to :region
      belongs_to :user

      has_many :photos, :as => :photable
      has_and_belongs_to_many :users
      
      validates_presence_of :title
      validates_presence_of :adv_text
      validates_presence_of :price
      validates_numericality_of :price
      validates_numericality_of :square
      
      accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes.any? {|k,v| v.blank? } }     
    end
    
  end
  
  module InstanceMethods
  end
  
end
