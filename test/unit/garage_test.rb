require 'test_helper'

class GarageTest < ActiveRecord::TestCase
  
  fixtures :garages
  
  should_have_db_column :title
  should_have_db_column :i_am_type
  should_have_db_column :address
  should_have_db_column :square
  should_have_db_column :adv_text
  should_have_db_column :price
  should_have_db_column :currency_id
  should_have_db_column :price_cached
  should_have_db_column :contact_phone
  should_have_db_column :contact_email
  should_have_db_column :user_id
  
  context "A garage test context" do
    setup do
      
    end
    
    should 'test user noteable' do
      assert true
    end
  end
  
end