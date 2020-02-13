Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'home#index'
  
  resources :users,only: [:index,:show,:edit,:create,:destroy] do
    member do
      get 'logout'
    end
  end
  
  resources :images,only: [:destroy]

  resources :categories, only: [:index]

  resources :signup do
    collection do
      get 'registration'
      get 'address'
    end
  end

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
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      post 'pay/:id'=> 'items#pay', as: 'pay'
    end

    member do
      get 'confirm'
      get 'delete'
    end
  end  
end