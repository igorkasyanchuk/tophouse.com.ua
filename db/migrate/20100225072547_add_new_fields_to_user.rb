class AddNewFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :company_name, :string
    add_column :users, :website,       :string
    add_column :users, :contact_email, :string
    add_column :users, :description,   :text
    
    add_column :users, :logo_file_name,    :string
    add_column :users, :logo_content_type, :string
    add_column :users, :logo_file_size,    :integer
    add_column :users, :logo_updated_at,   :datetime
  end

  def self.down
    remove_column :users, :company_name
    remove_column :users, :website
    remove_column :users, :contact_email
    remove_column :users, :start_price
    remove_column :users, :description
    
    remove_column :users, :logo_file_name
    remove_column :users, :logo_content_type
    remove_column :users, :logo_file_size
    remove_column :users, :logo_updated_at
  end
end
