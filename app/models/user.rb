class User < ActiveRecord::Base
  include Pacecar
  include Clearance::User
  
  enumeration_for :role, ROLES_ARRAY, :single => true
  enumeration_for :plan, ["A", "B", "C"], :single => true
  has_attached_file :logo, :styles => { :thumb => ["120x40>", :png]}
  
  def to_param
    "#{id}-#{(company_name || "").gsub(/[^a-z0-9а-яА-ЯіІїЇєЄъы]+/i, '-')}"
  end
  
  def has_role?(r)
    self.role == r
  end

  def has_role!(r)
    self.role = r
    self.save
  end
  
  def is_admin?
    has_role? (ADMIN_USER_ROLE)
  end

  alias admin? is_admin?
  
  def user_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def rieltor?
    self.is_a?(Rieltor)
  end

  def company?
    self.is_a?(Company)
  end

  def agent?
    self.is_a?(Agent)
  end
    
end
