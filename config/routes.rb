Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'home#index'

  namespace :items do
    resources :searches, only: :index
  end  
  
  resources :users,only: [:index,:show,:edit,:create,:destroy] do
    member do
      get 'logout'
    end
  end
  
  resources :addresses,only: [:edit, :update,:show]
  
  resources :images,only: [:destroy]

  resources :categories, only: [:index, :show]

  resources :cards, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'cards#delete'
      post 'show'
    end
    member do
      get 'confirmation'
    end
  end 

  resources :items do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      post 'pay/:id', to: 'items#pay', as: 'pay'
    end

    member do
      get 'confirm'
      get 'delete'
    end
  end  

  post "favorites/:item_id/create" => "favorites#create"
  post "favorites/:item_id/destroy" => "favorites#destroy"

end