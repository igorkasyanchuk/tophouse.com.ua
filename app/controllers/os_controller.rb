class OsController < InheritedResources::Base
  actions :index, :show
  respond_to :html

	def index
	  @os = O.all
	end
	
	def routes
	  @os = O.all
	end
	
	def cities
	  @o = resource
	  @cities = @o.routes_cities
	end

	def show
	  @o = resource
	end
  
end