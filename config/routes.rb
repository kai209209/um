Rails.application.routes.draw do
  root 'static#index'

  devise_for :users
  resources :users, only: [:index,:show] do
    collection do
      get :profile
    end
  end

end
