class RemoveNotNeededColumns < ActiveRecord::Migration
  def self.up
    remove_column :ms, :code
    remove_column :ms, :code1
    remove_column :ms, :old_code
    remove_column :ms, :old_code1
  end

  def self.down
  end
end
