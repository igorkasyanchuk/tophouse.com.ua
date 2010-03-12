class General::GaragesController < General::AdminController
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  belongs_to :user
  
  def new
    new! {
      3.times { @garage.photos.build }
    }
  end
  
  def edit
    edit! {
      (3 - @garage.photos.count).times { @garage.photos.build }
    }
  end
  
  protected
  
   def resource
      if current_user.admin?
        @garage ||= Garage.find params[:id]
      else
        super
      end
   end
  
    def collection
      if current_user.admin?
        @search = Garage.search(params[:search])
        @garages  = @search.paginate(:page => params[:page])
      else
        @search = end_of_association_chain.search(params[:search])
        @garages  = @search.paginate(:page => params[:page])
      end
    end
    
end