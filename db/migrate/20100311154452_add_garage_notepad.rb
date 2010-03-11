class AddGarageNotepad < ActiveRecord::Migration
  def self.up
    create_table :garages_users, :id => false do |t|
      t.integer :garage_id
      t.integer :user_id
    end
    add_index :garages_users, :user_id
  end

  def self.down
    remove_index :garages_users, :user_id
    drop_table :garages_users
  end
end
