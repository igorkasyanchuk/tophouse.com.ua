require 'test_helper'

class RegionsControllerTest < ActionController::TestCase
  
  test 'create' do
    Region.any_instance.expects(:save).returns(true)
    @region = regions(:basic)
    post :create, :region => @region.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Region.any_instance.expects(:save).returns(false)
    @region = regions(:basic)
    post :create, :region => @region.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Region.any_instance.expects(:save).returns(true)
    @region = regions(:basic)
    put :update, :id => regions(:basic).to_param, :region => @region.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Region.any_instance.expects(:save).returns(false)
    @region = regions(:basic)
    put :update, :id => regions(:basic).to_param, :region => @region.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Region.any_instance.expects(:destroy).returns(true)
    @region = regions(:basic)
    delete :destroy, :id => @region.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @region = regions(:basic)
    get :edit, :id => @region.to_param
    assert_response :success
  end
  
  test 'show' do
    @region = regions(:basic)
    get :show, :id => @region.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:regions)
  end
  
end