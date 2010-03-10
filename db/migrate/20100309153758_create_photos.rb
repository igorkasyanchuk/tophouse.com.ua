class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      
      t.integer :photable_id
      t.string :photable_type
    end
    add_index :photos, :photable_id
    add_index :photos, [:photable_id, :photable_type]
  end
  
  def self.down
    remove_index :photos, :photable_id
    remove_index :photos, [:photable_id, :photable_type]
    drop_table :photos
  end
end