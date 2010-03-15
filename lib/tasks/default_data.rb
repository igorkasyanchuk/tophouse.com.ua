$KCODE = 'UTF8'

require "rubygems"
require 'yaml'
require 'ya2yaml'
require 'google_translate'
require '../../config/environment.rb'
require 'faker'

def save_file(fnm, h)
  File.open(fnm, 'w') do |out|
    out.write h.ya2yaml
  end
end

def load_file(fnm)
  YAML::load_file(fnm)
end

Company.destroy_all
Agent.destroy_all
Rieltor.destroy_all
User.destroy_all

Region.destroy_all
input = load_file('import')
input.each do |rec|
  r = Region.find_by_name_uk rec[:obl_uk]
  r = Region.create({:name_uk => rec[:obl_uk], :name_ru => rec[:obl_ru]}) unless r
  r.cities.create({ :name_uk => rec[:name_uk], :name_ru => rec[:name_ru]})
end

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
