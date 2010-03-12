require 'test_helper'

class HomePageTestTest < ActionController::IntegrationTest
  fixtures :all

  test "Home page available" do
    visit "/"
    assert_response :success
    assert_contain 'TopHouse.com.ua'
  end
  
end
