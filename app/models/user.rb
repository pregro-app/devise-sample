class User < ApplicationRecord
  attr_accessor :email_confirmation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def password_required?
    super if confirmed?
  end
end
