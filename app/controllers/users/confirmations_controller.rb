# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    super if resource.nil? or resource.confirmed?
  end

  def confirm
    
    
    binding.pry
    
    confirmation_token = params[resource_name][:confirmation_token]
    self.resource = resource_class.find_by_confirmation_token!(confirmation_token)

    if resource.update(confirm_params)
      self.resource = resource_class.confirm_by_token(confirmation_token)
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)
    else
      render :show
    end
  end

  private
    def confirm_params
      params.require(resource_name).permit(:password, :name, :age)
    end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
