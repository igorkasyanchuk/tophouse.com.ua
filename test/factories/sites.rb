Factory.define :site, :class => Site do |f|
  f.name { Factory.next(:name) }
  f.dollar 800
  f.euro 1100
end