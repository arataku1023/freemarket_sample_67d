Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :users,only: [:index,:show,:edit,:create]

  resources :images

  resources :categories, only: [:index]

  resources :signup do
    collection do
      get 'registration'
      get 'address'
    end
  end
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'confirm'
      get 'confirm'
    end
  end  
end

