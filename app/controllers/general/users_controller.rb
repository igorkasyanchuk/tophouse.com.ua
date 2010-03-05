class General::UsersController < General::AdminController
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Photographer Information successfully updated.'
      redirect_to general_dashboard_path
    else
      flash[:error] = 'Please fix error below.'
      render '/general/dashboard/index', :layout => true
    end
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
  
  def downgrade_plan
    @user = current_user
    result = @user.downgrade!
    if result
      flash[:notice] = 'You successfully downgraded your SnapKnot account to a Free Subscription'
    else
      flash[:error] = 'Downgrading fails. Please contact support for help.'
    end
    redirect_to general_dashboard_path
  end
  
  def want_to_upgrade_plan
    @user = current_user
  end

  def edit_billing_details
    @user = current_user
  end
  
  def upgrade_plan
    @user = current_user
    result = @user.upgrade!(params[:user])
    if @user.upgrade!(params[:user])
      flash[:notice] = 'You have successfully upgraded your SnapKnot account to a Premium Subscription'
      redirect_to general_dashboard_path
    else
      flash[:error] = 'Please enter your billing details.'
      render :want_to_upgrade_plan
    end
  end
  
  def update_billing_details
    @user = current_user
    @user.validate_step2 = true
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Billing Details successfully updated.'
      redirect_to general_dashboard_path
    else
      flash[:error] = 'Please enter your billing details.'
      render :edit_billing_details
    end
  end
  
  def cancel_subscription
    @user = current_user
    if @user.cancel_subscription!
      flash[:notice] = 'Your account is deleted.'
      @user.destroy
      redirect_to root_path
    else
      flash[:errors] = "Can't cancel account. Please contact support."
      redirect_to general_dashboard_path
    end
  end
  
  def edit_locations
    @user = User.find params[:id]
    (4 - @user.user_locations.additional.count).times { @user.user_locations.build(:main_city => false) }
  end
  
  def statistics
    @user = User.find params["id"]
    redirect_to general_dashboard_path if !@user.premium_plan? && !@user.admin?
  end
  
end
