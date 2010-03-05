class Admin::UsersController < Admin::AdminController
  actions :index, :show, :edit, :update, :destroy, :confirm, :update_handle, :edit_handle
  respond_to :html, :js, :xml, :json
  add_pagination!(30)
  
  def index
    if params['q']
      @users = User.search_for(params['q'], :on => [:first_name, :last_name, :company_name, :email, :selected_plan]).paginate :page => params[:page],  :order => 'users.created_at DESC'
    else
      @users = User.paginate :page => params[:page],  :order => 'users.created_at DESC'
    end
  end
  
  def edit_handle
    @user = resource
  end
  
  def update_handle
    @user = resource
    @user.selected_plan = params['user']['selected_plan']
    @user.update_selected_plan! if @user.selected_plan_changed?
    flash[:notice] = "Product handle is updated."
    redirect_to admin_users_path
  end
  
  def confirm
    resource.confirm_email!
    flash[:notice] = "User is confirmed"
    redirect_to admin_users_path
  end
  
end
