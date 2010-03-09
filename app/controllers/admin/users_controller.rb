class Admin::UsersController < Admin::AdminController
  actions :index, :show, :edit, :update, :destroy, :confirm
  respond_to :html, :js, :xml, :json
  
  def index
    if params['q']
      @users = User.search_for(params['q'], :on => [:first_name, :last_name, :company_name, :email]).paginate :page => params[:page],  :order => 'users.created_at DESC', :per_page => 20
    else
      @users = User.paginate :page => params[:page],  :order => 'users.created_at DESC', :per_page => 20
    end
  end
  
  def confirm
    resource.confirm_email!
    flash[:notice] = "User is confirmed"
    redirect_to admin_users_path
  end
  
end
