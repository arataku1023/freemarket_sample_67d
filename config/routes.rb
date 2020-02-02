Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
  root 'home#index'
  resources :users,only: [:index,:show,:edit,:create]
　resousces :items
  resources :categories, only: [:index]
end

