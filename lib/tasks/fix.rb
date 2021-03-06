$KCODE = 'UTF8'

require "rubygems"
require 'yaml'
require 'ya2yaml'
require 'google_translate'
require '../../config/environment.rb'

O.all.each do |o|
  o.name_uk = o.name_uk.strip
  o.name_en = o.name_en.strip
  o.name_ru = o.name_ru.strip
  o.name_uk = o.name_uk.gsub('&#39;', "'")
  o.name_ru = o.name_ru.gsub('&#39;', "'")
  o.name_en = o.name_en.gsub('&#39;', "'")
  o.save
end

R.all.each do |o|
  o.name_uk = o.name_uk.strip
  o.name_en = o.name_en.strip
  o.name_ru = o.name_ru.strip
  o.name_uk = o.name_uk.gsub('&#39;', "'")
  o.name_ru = o.name_ru.gsub('&#39;', "'")
  o.name_en = o.name_en.gsub('&#39;', "'")
  o.save
end

M.all.each do |o|
  o.name_uk = o.name_uk.strip
  o.name_en = o.name_en.strip
  o.name_ru = o.name_ru.strip
  o.name_uk = o.name_uk.gsub('&#39;', "'")
  o.name_ru = o.name_ru.gsub('&#39;', "'")
  o.name_en = o.name_en.gsub('&#39;', "'")
  o.save
end

Popular.all.each do |o|
  o.name_uk = o.name_uk.strip
  o.name_en = o.name_en.strip
  o.name_ru = o.name_ru.strip
  o.name_uk = o.name_uk.gsub('&#39;', "'")
  o.name_ru = o.name_ru.gsub('&#39;', "'")
  o.name_en = o.name_en.gsub('&#39;', "'")
  o.save
end