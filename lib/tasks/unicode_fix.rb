$KCODE = 'UTF8'

require "rubygems"
require 'yaml'
require 'ya2yaml'
require 'google_translate'
require '../../config/environment.rb'
require 'faker'
require 'unicode' 

City.all.each do |c|
  c.name_uk = Unicode.downcase(c.name_uk).gsub(/\b(\w)/) { |first_letter_in_word| Unicode.upcase(first_letter_in_word) } 
  c.name_ru = Unicode.downcase(c.name_ru).gsub(/\b(\w)/) { |first_letter_in_word| Unicode.upcase(first_letter_in_word) } 
  c.save
end

Region.all.each do |c|
  c.name_uk = Unicode.downcase(c.name_uk).gsub(/\b(\w)/) { |first_letter_in_word| Unicode.upcase(first_letter_in_word) } 
  c.name_ru = Unicode.downcase(c.name_ru).gsub(/\b(\w)/) { |first_letter_in_word| Unicode.upcase(first_letter_in_word) } 
  c.save
end
