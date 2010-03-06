require 'test_helper'

class GaragesControllerTest < ActionController::TestCase
  
  context 'create' do
    setup do
      @garage = Factory(:garage)
      post :create, :garage => @garage.attributes
      @garage = Garage.find(:all).last
    end
    should_redirect_to 'resource_path(@garage)'
  end
  
  context 'update' do
    setup do
      @garage = Factory(:garage)
      put :update, :id => @garage.to_param, :garage => @garage.attributes
    end
    should_redirect_to 'resource_path(@garage)'
  end
  
  context 'destroy' do
    setup do
      @garage = Factory(:garage)
      delete :destroy, :id => @garage.to_param
    end
    should_redirect_to 'collection_path'
  end
  
  context 'new' do
    setup do
      get :new
    end
    should_respond_with :success
    should_render_template :new
    should_assign_to :garage
  end
  
  context 'edit' do
    setup do
      @garage = Factory(:garage)
      get :edit, :id => @garage.to_param
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :garage
  end
  
  context 'show' do
    setup do
      @garage = Factory(:garage)
      get :show, :id => @garage.to_param
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :garage
  end
  
  context 'index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :garages
  end
  
end
