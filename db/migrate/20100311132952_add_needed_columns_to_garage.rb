class AddNeededColumnsToGarage < ActiveRecord::Migration
  def self.up
    add_column :garages, :published_to, :date
    add_column :garages, :published, :boolean, :default => true
    add_column :garages, :views, :integer, :default => 0
  end

  def self.down
    remove_column :garages, :published_to
    remove_column :garages, :published
    remove_column :garages, :views
  end
end
