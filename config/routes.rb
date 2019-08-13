Rails.application.routes.draw do
  get 'photos/index'
  get 'photos/show'
  get 'photos/new'
  get 'photos/create'
  get 'photos/destroy'
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'user_dashboard'
  resources :photos, except: [:edit, :update] do
    resources :products, only: [:create]
  end
  resources :cart_products, only: [:destroy]
  resources :carts, only: [:show] do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:show, :edit, :update]
end

