Factory.define :garage, :class => Garage do |f|
  f.title { Factory.next(:name) }
  f.association :region, :factory => :region
  f.association :city, :factory => :city
  f.i_am_type I_AM_TYPES.rand
  f.address { Factory.next(:name) }
  f.square [55,77,88].rand
  f.adv_text 'Adv Text'
  f.price [500,600,900].rand
  f.currency_id CURRENCIES.rand
  f.contact_phone  '55-88-99'
  f.contact_email { Factory.next(:email) }
  f.association :user
  f.adv_type ADV_TYPES.rand
  f.published_on PUSHED_DAYS_DURATION.rand
  f.hot [false, false, true].rand
end