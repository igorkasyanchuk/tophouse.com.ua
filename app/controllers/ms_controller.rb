class MsController < InheritedResources::Base

	def show
	  @m = resource
	  @q = "#{@m.o.name}, #{@m.name}"
	  add_to_history(@q)
	end
	
	def routes
	  @m = resource
	  @o = @m.o
	  @routes = @m.map_routes
	end
  
end
