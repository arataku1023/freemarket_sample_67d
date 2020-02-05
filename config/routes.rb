Rails.application.routes.draw do
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
  resources :categories, only: [:index]
end

