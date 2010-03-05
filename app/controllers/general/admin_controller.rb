class General::AdminController < InheritedResources::Base
  before_filter :authenticate 
  layout 'admin'
end
