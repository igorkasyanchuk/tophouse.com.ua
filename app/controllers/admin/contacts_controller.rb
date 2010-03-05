class Admin::ContactsController < Admin::AdminController
  actions :index, :show, :destroy
  respond_to :html, :js, :xml, :json
  add_pagination!
end