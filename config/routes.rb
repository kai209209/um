Rails.application.routes.draw do
  root 'static#index'

  devise_for :users
  resource :user, only: [:show]
end
