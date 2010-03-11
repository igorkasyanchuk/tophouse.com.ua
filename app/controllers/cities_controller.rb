class CitiesController < InheritedResources::Base
  actions :index, :show
  respond_to :html
  
  def index
    index!
  end
  
  def show
    cookies[:selected_city] = { :value => resource.id, :expires => 1.year.from_now }
    redirect_to root_path
  end  
  
end