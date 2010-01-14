class <%= plural_class_name %>Controller < ApplicationController
  load_and_authorize_resource
  
  rescue_from ActiveRecord::RecordNotFound, :with => :invalid_request

  <%= controller_methods :actions %>

  private
  def invalid_request
    flash[:error] = "Couldn't find that <%= class_name %>"
    redirect_to root_url
  end
end
