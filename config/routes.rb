Rails.application.routes.draw do
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

