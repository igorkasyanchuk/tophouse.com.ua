$KCODE = 'UTF8'

require "rubygems"
require 'yaml'
require 'ya2yaml'
require 'google_translate'
require '../../config/environment.rb'
require 'faker'

  # a.first_name = Faker::Name.first_name
  # a.last_name = Faker::Name.last_name
  # a.web_site = Faker::Internet.domain_name
  # a.short_description = Faker::Lorem.paragraph
  # a.description = Faker::Lorem.paragraphs
  # a.city_id = cities.rand
  # a.phone_home = Faker::PhoneNumber.phone_number
  # a.phone_mobile_1 = Faker::PhoneNumber.phone_number
  # a.phone_mobile_2 = Faker::PhoneNumber.phone_number
  # a.phone_mobile_3 = Faker::PhoneNumber.phone_number
  # a.fax = Faker::PhoneNumber.phone_number

# title
# i_am_type
# region_id
# city_id
# address
# square
# adv_text
# price
# currency_id
# price_cached
# contact_phone
# contact_email
# user_id
# adv_type

@cities = City.all.collect(&:id)

def add_garage(user)
  g = user.garages.build
  g.title = Faker::Company.name
  g.i_am_type = I_AM_TYPES.rand
  g.city_id = @cities.rand
  g.address = Faker::Address.street_address
  g.square = (1..100).to_a.rand
  g.adv_text = Faker::Lorem.paragraph
  g.price = (100..1000).to_a.rand
  g.currency_id = CURRENCIES.rand
  g.contact_phone = Faker::PhoneNumber.phone_number
  g.contact_email = Faker::Internet.email
  g.save
end

User.all.each do |user|
  45.times { add_garage(user) }
end

