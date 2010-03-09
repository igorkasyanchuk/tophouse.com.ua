require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  
  test 'create' do
    City.any_instance.expects(:save).returns(true)
    @city = cities(:basic)
    post :create, :city => @city.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    City.any_instance.expects(:save).returns(false)
    @city = cities(:basic)
    post :create, :city => @city.attributes
    assert_template 'new'
  end
  
  test 'update' do
    City.any_instance.expects(:save).returns(true)
    @city = cities(:basic)
    put :update, :id => cities(:basic).to_param, :city => @city.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    City.any_instance.expects(:save).returns(false)
    @city = cities(:basic)
    put :update, :id => cities(:basic).to_param, :city => @city.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    City.any_instance.expects(:destroy).returns(true)
    @city = cities(:basic)
    delete :destroy, :id => @city.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @city = cities(:basic)
    get :edit, :id => @city.to_param
    assert_response :success
  end
  
  test 'show' do
    @city = cities(:basic)
    get :show, :id => @city.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end
  
end