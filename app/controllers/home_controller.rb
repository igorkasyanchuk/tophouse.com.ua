class HomeController < ApplicationController

  def index
  end

  def select_city
    unless params['selected_city']
      cookies[:selected_city] = nil
      redirect_to root_path
    else
      redirect_to city_path(City.find(params['selected_city']["to_s"]))
    end
  end

end
