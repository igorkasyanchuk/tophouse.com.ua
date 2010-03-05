class User < ActiveRecord::Base
  include Pacecar
  include Clearance::User
  
  has_and_belongs_to_many :roles 
  has_attached_file :logo, :styles => { :thumb => ["120x40>", :png]}

  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    #return true if @_list.include?(DAILY_DIGITAL_ADMIN_ROLE)
    (@_list.include?(role_in_question.to_s) )
  end
  # ---------------------------------------  
  
  def has_role!(role_name)
    self.roles << (Role.find_or_create_by_name role_name) unless has_role?(role_name)
    self.save
  end
  
  def has_no_roles!
    self.roles.delete_all
  end
  
  def roles_short
    self.roles.collect{|r| r.name}.to_sentence
  end
  
  def is_admin?
    has_role? (ADMIN_USER_ROLE)
  end
  
  alias admin? is_admin?
    
end
