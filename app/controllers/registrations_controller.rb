class RegistrationsController < ApplicationController


  def show
    @user = User.new
  end

  def create
    
    
    @user = User.new(user_params)
    
    
    binding.pry
    
    @user.save!
    # セーブができたら
    redirect_to "http://www.pikawaka.com"
  end


  private 
  def user_params
    params.require(:user).permit(:email ,:password, :password_confirmation)
  end
  
end


