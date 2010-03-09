class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name_uk
      t.string :name_ru
    end
  end
  
  def self.down
    drop_table :regions
  end
end