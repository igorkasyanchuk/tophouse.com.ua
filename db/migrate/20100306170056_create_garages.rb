class CreateGarages < ActiveRecord::Migration
  def self.up
    create_table :garages do |t|
      t.string :title
      t.integer :i_am_type
      t.integer :region_id
      t.integer :city_id
      t.string :address
      t.float :square
      t.text :adv_text
      t.integer :price
      t.integer :currency_id
      t.integer :price_cached
      t.string :contact_phone
      t.string :contact_email
      t.integer :user_id
      
      t.integer :adv_type
      
      t.timestamps
    end
    add_index :garages, :city_id
  end
  
  def self.down
    remove_index :garages, :city_id
    drop_table :garages
  end
end