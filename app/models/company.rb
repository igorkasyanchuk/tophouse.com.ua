class Company < User
  validates_presence_of :company_name
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :city_id
end
