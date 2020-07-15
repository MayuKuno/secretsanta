Rails.application.routes.draw do

  devise_for :users
  root to: 'top#index'
  resources :posts do
    collection do
      get 'search'
    end
    
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :messages
  resources :groups do
    resources :messages, only: [:index, :create]
  end
  resources :categories
  resources :givers
  resources :relationships,       only: [:create, :destroy]

end

