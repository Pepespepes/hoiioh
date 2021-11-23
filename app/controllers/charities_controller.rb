class CharitiesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_perameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:charity_name, :category, :description])
  end
end
