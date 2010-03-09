class CitiesController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  


  protected
    
    def collection
      @search = end_of_association_chain.search(params[:search])
      @cities  = @search.paginate(:page => params[:page])
    end

        
end