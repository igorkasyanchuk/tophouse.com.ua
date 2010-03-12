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
  should_have_db_column :published_to
  should_have_db_column :published
  should_have_db_column :views
  should_have_db_column :premium_index
  should_have_db_column :star
  should_have_db_column :hot
  
  context "A garage test context" do
    setup do
      2.times { Factory(:city) }
      2.times { Factory(:user) }
      @garage = Factory(:garage)
    end
    
    should 'garage created by user' do
      assert_not_nil @garage
      assert_not_nil @garage.user.user_name
    end
    
    should 'count views' do
      assert_equal @garage.views, 0 
      @garage.viewed!
      assert_equal @garage.views, 1 
      @garage.viewed!
      @garage.viewed!
      assert_equal @garage.views, 3
    end
    
    should 'be able to be added to notepad' do
      @user = Factory(:user)
      assert_equal @user.notes_garages.count, 0
      @user.to_notepad(@garage)
      assert_equal @user.notes_garages.count, 1
    end
    
  end
  
end