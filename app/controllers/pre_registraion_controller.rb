class PreRegistraionController < ApplicationController

  def show
    @user = User.new
  end

  def create
    # メールアドレスが同じなら
    if user_params[:email] == user_params[:email_confirmation]
    @user = User.new(user_params.slice(:email, :password, :password_confirmation))
    end
  end


  private 
  def user_params
    password = Devise.friendly_token
    params.require(:user).permit(:email, :email_comfirmation).merge(password: password, password_confirmation: password )
  end
  
end


