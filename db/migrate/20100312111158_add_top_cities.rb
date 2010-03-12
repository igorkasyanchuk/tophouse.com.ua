class AddTopCities < ActiveRecord::Migration
  def self.up
    add_column :cities, :top_city, :boolean, :default => false
  end

  def self.down
    remove_column :cities, :top_city
  end
end
