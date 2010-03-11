Factory.define :city, :class => City do |f|
  f.name { Factory.next(:city_name) }
end