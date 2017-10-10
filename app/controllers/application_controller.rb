class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = [:name]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def landing
    render 'layouts/landing'
  end
end
