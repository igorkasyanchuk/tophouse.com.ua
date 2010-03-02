$KCODE = 'UTF8'

require "rubygems"
require 'yaml'
require 'ya2yaml'
require 'google_translate'
require '../../config/environment.rb'

t = Google::Translator.new

# total = PopularCountry.count
# PopularCountry.all.each do |c|
#   puts "Translating #{c.name_en}, #{c.id}/#{total}"
#   q = c.name_en
#   uk = t.translate('en', 'uk', q)
#   ru = t.translate('en', 'ru', q)
#   c.name_uk = uk
#   c.name_ru = ru
#   c.save
# end

# total = PopularState.count
# PopularState.all.each do |c|
#   puts "Translating #{c.name_en}, #{c.id}/#{total}"
#   q = c.name_en
#   uk = t.translate('en', 'uk', q)
#   ru = t.translate('en', 'ru', q)
#   c.name_uk = uk
#   c.name_ru = ru
#   c.save
# end

# total = PopularUkCity.count
# PopularUkCity.all.each do |c|
#   puts "Translating #{c.name_uk}, #{c.id}/#{total}"
#   q = c.name_uk
#   ru = t.translate('uk', 'ru', q)
#   en = t.translate('uk', 'en', q)
#   c.name_ru = ru
#   c.name_en = en
#   c.save
# end
# 
# total = PopularRuCity.count
# PopularRuCity.all.each do |c|
#   q = c.name_ru
#   puts "Translating #{q}, #{c.id}/#{total}"
#   uk = t.translate('ru', 'uk', q)
#   en = t.translate('ru', 'en', q)
#   c.name_uk = uk
#   c.name_en = en
#   c.save
# end


total = PopularByCity.count
PopularByCity.all.each do |c|
  q = c.name_ru
  puts "Translating #{q}, #{c.id}/#{total}"
  uk = t.translate('ru', 'uk', q)
  en = t.translate('ru', 'en', q)
  c.name_uk = uk
  c.name_en = en
  c.save
end