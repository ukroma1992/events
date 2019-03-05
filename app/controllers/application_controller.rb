class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:password, :password_confirmation, :current_password)
    end
  end

  def current_user_can_edit?(model)  
    user_signed_in? && 
      (model.user == current_user  || (model.try(:event).present? && model.event.user == current_user)) 
  end
end
