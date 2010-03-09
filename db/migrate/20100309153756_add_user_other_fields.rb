class AddUserOtherFields < ActiveRecord::Migration
  def self.up
    add_column :users, :address, :string
    add_column :users, :gendre, :integer
    add_column :users, :position, :string
    add_column :users, :dob, :date
    add_column :users, :second_name, :string
  end

  def self.down
    remove_column :users, :address
    remove_column :users, :gendre
    remove_column :users, :position
    remove_column :users, :dob
    remove_column :users, :second_name
  end
end
