class ApplicationController < ActionController::Base
  # private

  # def after_confirmation_path_for(resource_or_scope)
  #   new_pre_registration
  # end

  # def after_sign_up_path_for(resource_or_scope)
  #   new_pre_registration
  # end

  # def after_inactive_sign_up_path_for(resource_or_scope)
  #   new_pre_registration
  # end

before_action :configure_permitted_parameters, if: :devise_controller?

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age])
end

end
