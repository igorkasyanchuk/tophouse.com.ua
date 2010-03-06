class CreateGarages < ActiveRecord::Migration
  def self.up
    create_table :garages do |t|
      t.string :title
      t.integer :i_am_type
      t.integer :o_id
      t.integer :m_id
      t.string :address
      t.float :square
      t.text :adv_text
      t.integer :price
      t.integer :currency_id
      t.integer :price_cached
      t.string :contact_phone
      t.string :contact_email
      t.integer :user_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :garages
  end
end