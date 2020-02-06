Rails.application.routes.draw do
  # get 'items/confirm'
  # devise_for :users
  # root 'home#index'
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
  #下三行コメントアウト
  devise_for :users
  root 'home#index'
  resources :users,only: [:index,:show,:edit,:create]

  root 'signup#registration'
  resources :signup do
    collection do
      get 'registration'
      get 'address'
    end
  end
  get 'items/confirm'
  devise_for :users
  root 'home#index'
  resources :users,only: [:index,:show,:edit,:create]
  resources :items do
    member do
      get 'confirm'
    end
  end
  # resources :users,only: [:index,:show,:edit,:create] do
  #   member do
  #     get 'logout'
  #   end
  # end
  # resources :items do
  #   member do
  #     get 'confirm'
  #   end
  # end  
  # resources :categories, only: [:index]
end
