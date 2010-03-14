ActionController::Routing::Routes.draw do |map|
  map.filter 'locale'
  
  map.resources :regions, :only => [:index, :show], :shallow => true do |rmap|
    rmap.resources :cities, :only => [:index, :show]
  end
  
  map.resources :cities, :only => [:index, :show] do |cmap|
    cmap.resources :garages, :collection => { :sell => :get, :buy => :get, :rent => :get, :give => :get }, :except => [:update, :destroy, :edit]
  end
  map.resources :garages, :collection => { :sell => :get, :buy => :get, :rent => :get, :give => :get }, :except => [:update, :destroy, :edit]
  
  map.resources :agents, :except => [:update, :destroy]
  map.resources :companies, :except => [:update, :destroy]
  map.resources :rieltors, :except => [:update, :destroy]
  
  map.namespace :general do |general_map|
    general_map.dashboard 'dashboard', :controller => 'dashboard', :action => 'index'
    general_map.lots 'lots', :controller => 'dashboard', :action => 'lots'
    general_map.notepad 'notepad', :controller => 'dashboard', :action => 'notepad'
    general_map.resources :users, :only => [:update, :edit, :show], :member => { :edit_details => :any, :update_details => :any } do |umap|
      umap.resources :garages
    end
  end

  map.namespace :admin do |admin_map|
    admin_map.dashboard 'dashboard', :controller => 'dashboard', :action => 'index'
    admin_map.resources :rieltors, :except => [:new, :create]
    admin_map.resources :agents, :except => [:new, :create]
    admin_map.resources :companies, :except => [:new, :create]
    admin_map.resources :users, :except => [:new, :create]
  	admin_map.resources :user_logs
  	admin_map.resources :cities
  	admin_map.resource :site, :only => [:show, :edit, :update] 
  end

  map.resources :contacts, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.resources :feedbacks, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.root :controller => 'home', :action => 'index'
  map.site_map '/site_map', :controller => 'sitemap', :action => 'seo_site_map'
  map.connect "sitemap.xml", :controller => "sitemap", :action => "sitemap", :format => 'xml'
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'
  map.add_realty 'add_realty', :controller => 'home', :action => 'add_realty'
  map.select_city 'select_city', :controller => 'home', :action => 'select_city'
  
  Clearance::Routes.draw(map)
  map.sign_in  'sign-in', :controller => 'clearance/sessions', :action => 'new'
  map.sign_out 'sign-out',:controller => 'clearance/sessions', :action => 'destroy', :method => :delete   
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format' 
  map.connect '*path', :controller => 'home', :action => 'index'
end
