class GaragesController < InheritedResources::Base
  actions :index, :show, :new, :edit, :create, :update, :destroy, :sell, :buy, :rent, :give
  respond_to :html, :js, :xml, :json
  belongs_to :city, :optional => true
    
  layout_by_actions({
    "search" => ['index', 'sell', 'buy', 'rent', 'give']
  })
  
  def sell
    @search = end_of_association_chain.search(params[:search])
    @garages  = @search.paginate(:page => params[:page])
    render 'index'
  end
  
  def buy
    @search = end_of_association_chain.search(params[:search])
    @garages  = @search.paginate(:page => params[:page])
    render 'index'
  end
  
  def rent
    @search = end_of_association_chain.search(params[:search])
    @garages  = @search.paginate(:page => params[:page])
    render 'index'
  end
  
  def give
    @search = end_of_association_chain.search(params[:search])
    @garages  = @search.paginate(:page => params[:page])
    render 'index'
  end

  protected
    
    def collection
      @search = end_of_association_chain.search(params[:search])
      @garages  = @search.paginate(:page => params[:page])
    end

        
end