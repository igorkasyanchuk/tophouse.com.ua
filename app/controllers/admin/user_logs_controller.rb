class Admin::UserLogsController < Admin::AdminController
  actions :index
  respond_to :html, :js, :xml, :json
  add_pagination!(30)
  
  def index
    if params['q'] && !params['q'].blank?
      @user_logs = UserLog.paginate :page => params[:page], :order => 'id DESC', :conditions => { :user_id => params['q'] }
    else
      @user_logs = UserLog.paginate :page => params[:page], :order => 'id DESC'
    end
  end
  
end
