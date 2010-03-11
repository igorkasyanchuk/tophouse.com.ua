Factory.define :region, :class => Region do |f|
  f.name { Factory.next(:name) }
end