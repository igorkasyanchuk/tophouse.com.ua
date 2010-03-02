ActionController::Routing::Routes.draw do |map|
  map.filter 'locale'
  map.resources :os, :as => 'obls', :only => [:index, :show], :collection => { :routes => :any }, :member => { :cities => :any } do |mm|
    mm.resources :rs, :as => 'regs', :only => [:index, :show] do |rm|
      rm.resources :ms, :as => 'city', :only => [:index, :show]
    end
    mm.resources :ms, :only => [], :member => { :routes => :any }, :shallow => true, :as => 'city' do |rm|
      rm.resources :map_routes, :only => [:index, :show]
    end
  end
  
  map.resources :popular, :only => [:show]
  map.resources :popular_uk_city, :only => [:show], :controller => 'populars'
  map.resources :popular_ru_city, :only => [:show], :controller => 'populars'
  map.resources :popular_by_city, :only => [:show], :controller => 'populars'
  map.resources :popular_state, :only => [:show], :controller => 'populars'
  map.resources :popular_country, :only => [:show], :controller => 'populars'
  map.resources :popular_uk_region, :only => [:show], :controller => 'populars'
  
  map.resources :cities, :only => [], :collection => { :rus => :any, :bel => :any }
  map.resources :maps, :only => [], :collection => { :states => :any, :countries => :any }
  
  map.resources :contacts, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.resources :feedbacks, :only => [:new, :create, :destroy, :index], :controller => 'feedback'
  map.root :controller => 'home', :action => 'index'
  map.site_map '/site_map', :controller => 'sitemap', :action => 'seo_site_map'
  map.connect "sitemap.xml", :controller => "sitemap", :action => "sitemap", :format => 'xml'
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'   
  
  map.search '/search', :controller => 'home', :action => 'search'
  map.directions '/directions', :controller => 'home', :action => 'directions'
  
  map.your_searches '/your_searches', :controller => 'home', :action => 'your_searches'
  map.clear_history '/clear_history', :controller => 'home', :action => 'clear_history'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format' 
  map.connect '*path', :controller => 'home', :action => 'index'
end
