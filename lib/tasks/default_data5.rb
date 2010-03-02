O.all.each do |o|
  PopularUkRegion.create(o.attributes)
end