module TopHouseUtilities

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
    attr_accessor :published_on
    
    def to_dollar(field)
      (self.send(field) / Site.dollar.to_i)
    end
    
    def to_dollar_format(field)
      "#{to_dollar(field)} дол."
    end
    
    def to_euro(field)
      (self.send(field) / Site.euro.to_i)
    end
    
    def to_euro_format(field)
      "#{to_euro(field)} євро."
    end
    
    def to_grivna(field)
      self.send(field)
    end
    
    def to_grivna_format(field)
      "#{to_grivna(field)} грн."
    end
    
    def format_square(field)
      ("%.2f" % self.send(field)).gsub('.00', '')
    end
    
    def format_square_format(field)
      "#{format_square(field)} м²"
    end
    
    def before_save
      _p = self.price
      if self.currency_id == US_CURRENCY
        _p *= Site.dollar
      elsif self.currency_id == EURO_CURRENCY
        _p *= Site.euro
      end
      self.price_cached = _p
      c = City.find_by_id(city_id)
      self.region_id = c.region_id if c
      self.published_to = Time.now + self.published_on.to_i.days
    end
    
    def uuid
      "##{self.id}"
    end
    
    def viewed!
      self.increment!(:views)
    end
    
    def hot?
      self.hot
    end
    
    def page_title
      "#{self.address}, #{self.city.name}"
    end
    
    def full_price(field)
      if self.currency_id == US_CURRENCY
        "<span class='main_price'>#{to_dollar_format(field)}</span><span class='additional_price'>(#{to_grivna_format(field)}, #{to_euro_format(field)})</span>"
      elsif self.currency_id == EURO_CURRENCY
        "<span class='main_price'>#{to_euro_format(field)}</span><span class='additional_price'>(#{to_grivna_format(field)}, #{to_dollar_format(field)})</span>"
      else
        "<span class='main_price'>#{to_grivna_format(field)}</span><span class='additional_price'>(#{to_dollar_format(field)}, #{to_euro_format(field)})</span>"
      end
    end    
    
  end

end