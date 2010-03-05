class User < ActiveRecord::Base
  include Pacecar
  include Clearance::User
  
  has_and_belongs_to_many :roles 
  
  has_attached_file :logo, :styles => { :thumb => ["120x40>", :png]}
end
