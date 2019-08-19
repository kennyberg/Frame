Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'user_dashboard'
  resources :photos, except: [:edit, :update] do
    resources :products, only: [:create]
  end
  resources :favorites, only: [:create, :destroy]
  # we finally do not nest the favorites route because at this moment we do not have the photo.
  resources :products, only: [:edit, :update, :destroy]
  resources :cart_products, only: [:destroy]
  resources :carts, only: [:show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]
  end
end

