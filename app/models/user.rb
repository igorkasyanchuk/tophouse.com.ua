class User < ActiveRecord::Base
  include Pacecar
  include Clearance::User
  
  belongs_to :city
  belongs_to :region
  has_many :garages, :dependent => :destroy
  has_and_belongs_to_many :notes_garages, :join_table => 'garages_users'
  
  GENDERS = ['male', 'female']
  
  enumeration_for :role, ROLES_ARRAY, :single => true
  enumeration_for :plan, ["A", "B", "C"], :single => true
  enumeration_for :gendre, GENDERS, :single => true
  
  has_attached_file :logo, :styles => { :thumb => ["120x40>", :png]}
  has_attached_file :photo, :styles => { :thumb => ["50x50>", :png], :small => ["80x80>", :png], :normal => ["350x350>", :png]}
  
  validates_length_of :short_description, :maximum  => 250, :allow_nil => true, :allow_blank => true
  
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
  
  def to_notepad(noteable)
    if noteable.is_a?(Garage)
      self.notes_garages << noteable
    end
  end
  
  def class_info
    return 'rieltor_user' if rieltor?
    return 'company_user' if company?
    return 'agent_user' if agent?
    return 'admin_user' if admin?
    return 'user_user'
  end
  
  def user_info
    return 'rieltor' if rieltor?
    return 'company' if company?
    return 'agent' if agent?
    return 'admin' if admin?
    return 'user'
  end  
    
end
