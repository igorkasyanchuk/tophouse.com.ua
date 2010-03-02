class O < ActiveRecord::Base
  include Pacecar
  default_scope :order => 'name_uk'
  named_scope :random, :order => 'name_uk, RAND()'  
  has_many :rs
  has_many :ms
  has_many :map_routes, :foreign_key => "o_from_id"
  has_many :routes_cities, :class_name => "M", :through => :map_routes, :source => :m_from, :uniq => true
  def name
    self.send("name_#{I18n.locale}")
  end
end
