MapRoute.destroy_all

pcities = PopularLargeCity.all
count = pcities.size
pcities.each_with_index do |c1, index1|
  o1 = c1.o.id
  m1 = c1.m.id
  pcities.each_with_index do |c2, index2|
    next if index1 == index2
    r = MapRoute.new
    r.from_id = c1.id
    r.to_id = c2.id
    r.o_from_id = o1
    r.o_to_id = c2.o.id
    r.m_from_id = m1
    r.m_to_id = c2.m.id
    r.save
  end  
  puts "Processed: #{index1}/#{count}"
end