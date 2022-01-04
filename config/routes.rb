Rails.application.routes.draw do
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations',
  }
  devise_scope :user do
    patch "users/confirm" => "users/confirmations#confirm"
  end

  resource :pre_registration


  # letter_openerのルート
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
