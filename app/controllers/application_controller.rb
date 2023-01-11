class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  layout :get_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end

  private

    def get_layout
      if current_user.present?
        current_user.admin? ? "admin" : "restaurant"
      else
        "landing"
      end
    end
end
