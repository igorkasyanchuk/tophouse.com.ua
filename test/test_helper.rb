ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually 
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :city_name do |n|
  "City Name #{n}"
end

Factory.sequence :company_name do |n|
  "Company #{n}"
end

Factory.sequence :first_name do |n|
  "First #{n}"
end

Factory.sequence :last_name do |n|
  "Last #{n}"
end

Factory.sequence :name do |n|
  "Name #{n}"
end

User.attachment_definitions[:logo][:path] = ":rails_root/temp/public:url"

u = User.create({:email => 'admin@admin.com', :password => '123456', :password_confirmation => '123456'})
u.first_name = "Igor"
u.last_name = "Kasyanchuk"
u.role = ADMIN_USER_ROLE
u.save
u.confirm_email!

cities = City.all.collect(&:id)

5.times do
  a = Agent.create({:email => Faker::Internet.email, :password => '123456', :password_confirmation => '123456'})
  a.company_name = Faker::Company.name
  a.plan = PLANS.rand
  a.first_name = Faker::Name.first_name
  a.last_name = Faker::Name.last_name
  a.web_site = Faker::Internet.domain_name
  a.short_description = Faker::Lorem.paragraph
  a.description = Faker::Lorem.paragraphs
  a.city_id = cities.rand
  a.phone_home = Faker::PhoneNumber.phone_number
  a.phone_mobile_1 = Faker::PhoneNumber.phone_number
  a.phone_mobile_2 = Faker::PhoneNumber.phone_number
  a.phone_mobile_3 = Faker::PhoneNumber.phone_number
  a.fax = Faker::PhoneNumber.phone_number
  a.save
  a.confirm_email!
end

5.times do
  a = Company.create({:email => Faker::Internet.email, :password => '123456', :password_confirmation => '123456'})
  a.company_name = Faker::Company.name
  a.plan = PLANS.rand
  a.first_name = Faker::Name.first_name
  a.last_name = Faker::Name.last_name
  a.web_site = Faker::Internet.domain_name
  a.short_description = Faker::Lorem.paragraph
  a.description = Faker::Lorem.paragraphs
  a.city_id = cities.rand
  a.phone_home = Faker::PhoneNumber.phone_number
  a.phone_mobile_1 = Faker::PhoneNumber.phone_number
  a.phone_mobile_2 = Faker::PhoneNumber.phone_number
  a.phone_mobile_3 = Faker::PhoneNumber.phone_number
  a.fax = Faker::PhoneNumber.phone_number
  a.save
  a.confirm_email!
end

5.times do
  a = Rieltor.create({:email => Faker::Internet.email, :password => '123456', :password_confirmation => '123456'})
  a.company_name = Faker::Company.name
  a.plan = PLANS.rand
  a.first_name = Faker::Name.first_name
  a.last_name = Faker::Name.last_name
  a.web_site = Faker::Internet.domain_name
  a.short_description = Faker::Lorem.paragraph
  a.description = Faker::Lorem.paragraphs
  a.city_id = cities.rand
  a.phone_home = Faker::PhoneNumber.phone_number
  a.phone_mobile_1 = Faker::PhoneNumber.phone_number
  a.phone_mobile_2 = Faker::PhoneNumber.phone_number
  a.phone_mobile_3 = Faker::PhoneNumber.phone_number
  a.fax = Faker::PhoneNumber.phone_number
  a.save
  a.confirm_email!
end
