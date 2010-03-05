# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication 
  include SimpleCaptcha::ControllerHelpers
  self.allow_forgery_protection = true
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :ssl_required?
  helper_method :set_locale
  helper_method :available_locales
  before_filter :set_locale
  
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404   
  
  def available_locales
    AVAILABLE_LOCALES
  end
  
  def set_locale
    locale = params[:locale] || cookies[:locale]
    I18n.locale = locale.to_s
    cookies[:locale] = locale unless (cookies[:locale] && cookies[:locale] == locale)
  end
  
  def default_url_options(options={})
    { :locale => I18n.locale } 
  end
  
  def self.add_pagination!(pages = 10)
    class_eval %(
      protected
        def collection
          get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], :per_page => #{pages}))
        end)
  end
  
  private
    def render_optional_error_file(status_code)
      if status_code == :not_found
        render_404
      else
        flash[:error] = "You don't have access to that page."
        redirect_to root_path
      end
    end
    
    def render_404
      respond_to do |type| 
        type.html { render :controller => 'error', :action => 'a404', :template => "error/a404", :layout => 'application', :status => 404 } 
        type.all  { render :nothing => true, :status => 404 } 
      end
      true
    end     
  
    def history_from_cookies
      r = cookies[:history] || ''
      r
    end
    
    def set_history(h)
      while h.length > 1800
        logger.info h.length
        n = h.split(PopularsController::SYMBOL_END_HISTORY)
        n.delete_at(n.size - 1)
        h = n.join(PopularsController::SYMBOL_END_HISTORY)
      end
      cookies[:history] = {
        :value => h,
        :expires => 1.year.from_now
      }
    end
    
    def add_to_history(q)
      history = history_from_cookies
      history = "#{q}#{PopularsController::SYMBOL_SPLIT_HISTORY}#{request.url}#{PopularsController::SYMBOL_SPLIT_HISTORY}#{Time.now}#{PopularsController::SYMBOL_END_HISTORY}" + history
      set_history(history)
    end
  
end
