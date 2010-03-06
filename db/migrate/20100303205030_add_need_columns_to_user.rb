class AddNeedColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_name, :string
    add_column :users, :role, :integer
  end

  def self.down
    remove_column :users, :user_name
    remove_column :users, :role
  end
end
