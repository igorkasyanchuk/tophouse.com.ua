class HomeController < ApplicationController

  def index
  end

  def select_city
    unless params['city']
      cookies[:selected_city] = nil
      redirect_to root_path
    else
      redirect_to city_path(City.find(params['city']["selected_city"]))
    end
  end

end
