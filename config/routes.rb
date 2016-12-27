Rails.application.routes.draw do  
  mount ActionCable.server => '/cable'
  root 'static#index'
  get 'chating', to: 'chat#chating'

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
  resources :conversations, only: :show do
    collection do
      get :chat_with_friend_conversation
    end
  end
  resources :user_messages, only: :create
  resources :topics do 
    collection do
      get :topic_preview
    end
    resources :comments, only: [:create, :edit] do
      collection do 
        get :comment_preview
      end
    end
  end

end
