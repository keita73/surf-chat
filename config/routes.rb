Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
    resources :tweets do
      collection do
        get 'search'
      end
    end
  end
end
