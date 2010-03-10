class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.integer :dollar
      t.integer :euro
    end
    Site.create(:dollar => 805, :euro => 1150)
  end
  
  def self.down
    drop_table :sites
  end
end