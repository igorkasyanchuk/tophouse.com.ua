class HomeController < ApplicationController
  def index
  end

  def search
    @q = (params["q"] || "").mb_chars
    @q = @q.mb_chars.titleize
    
    add_to_history(@q)
    
    render :index
  end
  
  def directions
    @from = params["from"]
    @to = params["to"]
    
    add_to_history("#{I18n.t('marshrut')} #{@from} - #{@to}")
    
    render :index
  end
  
  def your_searches
    h = history_from_cookies
    @history = h.split(PopularsController::SYMBOL_END_HISTORY)
  end
  
  def clear_history
    cookies[:history] = nil
    redirect_to your_searches_path
  end

end
