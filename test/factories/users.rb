Factory.define :user, :class => User do |f|
  f.first_name { Factory.next(:first_name) }
  f.last_name { Factory.next(:last_name) }
  f.email { Factory.next(:email) }
  f.password "123456"
  f.password_confirmation "123456"
  f.company_name { Factory.next(:company_name) }
  f.plan PLANS.rand
  f.gendre GENDERS.rand
  f.address 'address'
  f.position 'position'
  f.dob Time.now.to_date
  f.second_name 'Second Name'
  f.association :city
  f.role ROLES_ARRAY.rand
  f.description 'Descr'
  f.short_description 'Short Descr'
  f.web_site 'http://google.com'
  f.fax '88-99-77'
  f.phone_home '99-88-77'
  f.phone_mobile_1 '099-99-88-77'
end