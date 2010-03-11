class AddPremiumOption < ActiveRecord::Migration
  def self.up
    add_column :garages, :premium_index, :integer, :default => 0
    add_column :garages, :star, :boolean, :default => false
    add_column :garages, :hot, :boolean, :default => false
  end

  def self.down
    remove_column :garages, :premium_index
    remove_column :garages, :star
    remove_column :garages, :hot
  end
end
