module TopHouseGeneral

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
  
  module ClassMethods
    
    def add_default_orders
      self.named_scope :ordered_by_city_name, :order => :name_uk
    end
    
  end
  
  module InstanceMethods
        
    def as_translation(field)
      I18n.t(self.send(field).to_s)
    end
    
    def name
      self.send("name_#{I18n.locale}")
    end

  end

end