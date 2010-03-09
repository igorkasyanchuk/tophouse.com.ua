class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name_uk
      t.string :name_ru
      t.integer :region_id
    end
    add_index :cities, :region_id
  end
  
  def self.down
    remove_index :cities, :region_id
    drop_table :cities
  end
end