class AddPhotoCountToGarage < ActiveRecord::Migration
  def self.up
    add_column :garages, :photos_count, :integer, :default => 0
  end

  def self.down
    remove_column :garages, :photos_count
  end
end
