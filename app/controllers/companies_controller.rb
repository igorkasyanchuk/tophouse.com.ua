class CompaniesController < InheritedResources::Base
  actions :index, :show
  respond_to :html, :js, :xml, :json
end
