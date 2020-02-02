Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
  root 'home#index'
  resources :users,only: [:index,:show,:edit,:create]
  resources :items
end
