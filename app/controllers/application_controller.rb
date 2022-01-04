class ApplicationController < ActionController::Base
  private

  def after_confirmation_path_for(resource_or_scope)
    new_pre_registration
  end

  def after_sign_up_path_for(resource_or_scope)
    new_pre_registration
  end

  def after_inactive_sign_up_path_for(resource_or_scope)
    new_pre_registration
  end

end
