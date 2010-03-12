Factory.define :city, :class => City do |f|
  f.name_uk { Factory.next(:city_name) }
  f.name_ru { Factory.next(:city_name) }
  f.association :region, :factory => :region
end