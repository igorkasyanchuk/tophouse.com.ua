class Admin::SitesController < Admin::AdminController
  actions :show, :edit, :update
  respond_to :html, :js, :xml, :json
  before_filter :find_site
  
  def show
  end

  def update
    if @site.update_attributes(params[:site])
      flash[:notice] = 'Site configuration is updated.'
      redirect_to admin_site_path
    else
      render :edit
    end
  end
  
  private
    def find_site
      @site = Site.configuration
    end
end