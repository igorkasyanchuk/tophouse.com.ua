module ApplicationHelper

  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << "<div class='#{msg} flash'>#{html_escape(flash[msg.to_sym])}</div>" unless flash[msg.to_sym].blank?
    end
    flash.clear
    messages
  end
  
  def title(t = SEO[:title], index = '')
    content_for :title do
      (t || "") + SEO[:title]
    end
  end
  
  def seo_process
    str = nil
    if defined?(@popular)
      str = @popular.name
      str = I18n.t('popular_uk', :str => str) if @popular.is_a?(PopularUkCity)
      str = I18n.t('popular_ru', :str => str) if @popular.is_a?(PopularRuCity)
      str = I18n.t('popular_bl', :str => str) if @popular.is_a?(PopularByCity)
      str = I18n.t('popular_map', :str => str) if @popular.is_a?(PopularCountry)
      str = I18n.t('popular_state', :str => str) if @popular.is_a?(PopularState)
      str = I18n.t('popular_ukraine', :str => str) if @popular.is_a?(PopularUkRegion)
    elsif defined?(@m)
      str = @m.name
      str = I18n.t('m_title', :str => str)
    elsif defined?(@route)
      str = "#{@route.from.name} - #{@route.to.name}"
      str = I18n.t('route_title', :str => str)
    elsif defined?(@q)
      str = @q
      str = I18n.t('q_title', :str => str)
    elsif defined?(@from) && defined?(@to)
      str = "#{@from} - #{@to}"
      str = I18n.t('from_to_title', :str => str)
    end
    return str || I18n.t('general_title')
  end
  
  def description_process
    str = seo_process
    str = I18n.t('description_process', :str => str)
    return str
  end

  def page_title(t = SEO[:page_title])
    content_for :object_title do
      t
    end
  end
  
  def description(t = SEO[:description], index = '')
    content_for :seo_description do
      (t || "") + SEO[:description]
    end
  end
  
  def keywords(t = SEO[:keywords], index = '')
    content_for :seo_keywords do
      (t || "") + SEO[:keywords]
    end
  end
  
  def footers(t = '')
    content_for :seo_footer do
      (t || "") + ' ' + (SEO[:footer] || "")
    end 
  end

  def yield_or_default(message, default_message = "")
    message.nil? ? default_message : message
  end     
  
  def sidebar(&block)
    content_for :sidebar, &block
  end

  def inside_layout(layout_name, &block)
    layout_name = layout_name.include?('/') ? layout_name : "layouts/#{layout_name}"
    @template.instance_variable_set("@content_for_layout", capture(&block))
    concat(@template.render(:file => layout_name, :user_full_path => true))
  end
  
  def logged_in?
    !!current_user
  end
  
  def is_admin?
    return false unless logged_in?
    current_user.admin?
  end
  
  def home_page?
    controller.controller_name == "home" && controller.action_name == "index" ||
    controller.controller_name == "home" && controller.action_name == "your_searches"
  end
  
  def search_page?
    (controller.controller_name == "home" && controller.action_name == "search") ||
    (controller.controller_name == "populars" && controller.action_name == "show") ||
    (controller.controller_name == "ms" && controller.action_name == "show")
  end

  def directions_page?
    controller.controller_name == "home" && controller.action_name == "directions" ||
    controller.controller_name == "map_routes" && controller.action_name == "show"    
  end
  
  def show_page?
    return true if controller_name == 'os' && controller.action_name == 'show'
    return false
  end
  
  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end
  
  def google_map
    current_locale = I18n.locale.to_s
    content_for :map do
      if Rails.env == 'production'
        '<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=' + GOOGLE_MAP[:production_key] + '&hl=' + current_locale + '" type="text/javascript"></script>'
      else
        '<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=' + GOOGLE_MAP[:development_key] + '&hl='+ current_locale + '" type="text/javascript"></script>'
      end
    end
  end
  
  def flag_link(locale, title)
    (link_to title, url_for(request.parameters.merge({:locale => locale})), :title => title ) 
  end
  
end
