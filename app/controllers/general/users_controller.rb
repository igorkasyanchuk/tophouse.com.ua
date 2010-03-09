class General::UsersController < General::AdminController
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Photographer Information successfully updated.'
      redirect_to general_dashboard_path
    else
      flash[:error] = 'Please fix error below.'
      render :edit
    end
  end
  
  def edit_details
    @user = current_user
  end
  
  def update_details
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User Details successfully updated.'
      redirect_to general_dashboard_path
    else
      flash[:error] = 'Please fix error below.'
      render :edit
    end
  end
  
  def delete_logo
    @user = current_user
    @user.logo = nil
    @user.save
    flash[:notice] = 'Logo successfully deleted.'
    redirect_to general_dashboard_path(:anchor => 'dashboard_logo_uploader')
  end
    
end
