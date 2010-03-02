f = File.open('cities.txt', 'r')
lines = f.readlines
puts "Lines: #{lines.size}"

PopularLargeCity.destroy_all

lines.each do |line|
  city, obl = line.split(';')[0].strip, line.split(';')[1].strip
  o = O.search_for(obl).first
  city_o = o.ms.find :first, :conditions => { :name_uk => city }
  attrs = {
    :name_uk => city_o.name_uk,
    :name_ru => city_o.name_ru,
    :name_en => city_o.name_en,
    :o_id => o.id,
    :m_id => city_o.id
  }
  PopularLargeCity.create(attrs)
end