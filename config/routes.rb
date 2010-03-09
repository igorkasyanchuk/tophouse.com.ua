ActionController::Routing::Routes.draw do |map|
  map.filter 'locale'
  
  map.resources :regions, :only => [:index, :show] do |rmap|
    rmap.resources :cities, :only => [:index, :show]
  end
  
  map.resources :garages, :except => [:update, :destroy]
  
  map.resources :agents, :except => [:update, :destroy]
  map.resources :companies, :except => [:update, :destroy]
  map.resources :rieltors, :except => [:update, :destroy]
  
  map.namespace :general do |general_map|
    general_map.dashboard 'dashboard', :controller => 'dashboard', :action => 'index'
    general_map.resources :users, :only => [:update, :edit] do |user_map|
      user_map.resources :photos, :only => [:destroy]
    end
  end

  map.namespace :admin do |admin_map|
    admin_map.dashboard 'dashboard', :controller => 'dashboard', :action => 'index'
    admin_map.resources :rieltors, :except => [:new, :create]
    admin_map.resources :agents, :except => [:new, :create]
    admin_map.resources :companies, :except => [:new, :create]
    admin_map.resources :users, :except => [:new, :create]
  	admin_map.resources :user_logs
  end

  map.resources :contacts, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.resources :feedbacks, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.root :controller => 'home', :action => 'index'
  map.site_map '/site_map', :controller => 'sitemap', :action => 'seo_site_map'
  map.connect "sitemap.xml", :controller => "sitemap", :action => "sitemap", :format => 'xml'
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'   
  
  Clearance::Routes.draw(map)
  map.sign_in  'sign-in', :controller => 'clearance/sessions', :action => 'new'
  map.sign_out 'sign-out',:controller => 'clearance/sessions', :action => 'destroy', :method => :delete   
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format' 
  map.connect '*path', :controller => 'home', :action => 'index'
end
