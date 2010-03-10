class General::GaragesController < General::AdminController
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  belongs_to :user

  protected
    def collection
      @search = end_of_association_chain.search(params[:search])
      @garages  = @search.paginate(:page => params[:page])
    end
end