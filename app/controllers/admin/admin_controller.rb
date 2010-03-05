class Admin::AdminController < InheritedResources::Base
  before_filter :authenticate 
  require_role ADMIN_USER_ROLE

  protected
    def render_optional_error_file(status)
      flash[:error] = "You don't have access to that page."
      redirect_to general_dashboard_path
    end
end
