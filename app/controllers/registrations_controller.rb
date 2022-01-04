class RegistrationsController < ApplicationController


  def show
    @user = User.new
  end

  def create
    @user = User.find_by(id: current_user.id)
    
    
    binding.pry
    
    @user.save!
    # セーブができたら
    redirect_to "http://www.pikawaka.com"
  end


  private 
  def user_params
    
    # email = Devise.friendly_token
    params.require(:user).permit(:id ,:password, :password_confirmation)
  end
  
end


