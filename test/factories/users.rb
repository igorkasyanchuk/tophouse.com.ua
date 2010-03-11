Factory.define :user, :class => User do |f|
  f.first_name { Factory.next(:first_name) }
  f.last_name { Factory.next(:last_name) }
  f.email { Factory.next(:email) }
  f.password "123456"
  f.password_confirmation "123456"
  f.start_price 1_000
  f.average_price 2_000
  f.end_price 3_000
  f.primary_city_id { Factory.create(:city).id }
  
  f.expiration_month 12
  f.expiration_year 2012
  f.credit_card_number '1'
  f.cvv '123'
  f.company_name { Factory.next(:company_name) }
  
  f.logo {  ActionController::TestUploadedFile.new File.join(RAILS_ROOT, 'test', 'photos', 'en.png') }
end