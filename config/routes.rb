Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :users,only: [:index,:show,:edit,:create] do
    member do
      get 'logout'
    end
  end
  resources :images

  resources :categories, only: [:index]

  resources :signup do
    collection do
      get 'registration'
      get 'address'
    end
  end

  resources :card, only: [:index, :new, :show, :destroy] do
    collection do
      post 'pay', to: 'card#pay'
    end
  end

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'confirm'
    end
  end  

end