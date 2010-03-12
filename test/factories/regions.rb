Factory.define :region, :class => Region do |f|
  f.name_uk { Factory.next(:name) }
  f.name_ru { Factory.next(:name) }
end