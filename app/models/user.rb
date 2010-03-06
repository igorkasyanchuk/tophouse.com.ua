class User < ActiveRecord::Base
  include Pacecar
  include Clearance::User
  
  enumeration_for :role, ROLES_ARRAY, :single => true
  has_attached_file :logo, :styles => { :thumb => ["120x40>", :png]}

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
    
end
