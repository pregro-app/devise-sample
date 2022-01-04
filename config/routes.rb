Rails.application.routes.draw do
  devise_for :users, controllers: {
    # :confirmations => 'users/confirmations',
    :confirmations => 'registrations',
  }
  devise_scope :user do
    # patch "users/confirm" => "users/confirmations#confirm"
    patch "users/confirm" => "pre_registrations#show"
  end

  resource :pre_registration
  resource :registration


  # letter_openerのルート
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
