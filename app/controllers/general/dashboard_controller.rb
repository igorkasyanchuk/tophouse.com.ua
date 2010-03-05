class General::DashboardController < General::AdminController

  def index
    @user = current_user
  end

end
