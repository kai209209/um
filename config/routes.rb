Rails.application.routes.draw do
  root 'static#index'

  devise_for :users
  resources :users, only: [:index,:show] do
    collection do
      get :profile, :friends
    end
  end

  resources :apply_friends, only: [:index, :create] do 
    collection do 
      patch :reapply
      get :operate_apply
    end
  end

  resources :friends_relationships

end
