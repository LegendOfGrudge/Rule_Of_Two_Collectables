Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"

  get '/home', to: 'home#index'
  get '/about', to: 'about#index'
  get '/search', to: 'search#search'
  get '/cart', to: 'cart#index'
  get '/orders', to: 'orders#show'

  resources :brands
  resources :collections
  resources :toys

  post '/toys/add_to_cart/:id', to: 'toys#add_to_cart', as: 'add_to_cart'
  post '/toys/update_cart/:id', to: 'toys#update_cart', as: 'update_cart'
  delete '/toys/remove_from_cart/:id', to: 'toys#remove_from_cart', as: 'remove_from_cart'

  post '/cart/create_order', to: 'cart#create_order', as: 'create_order'
  get "/cart/success", to: "cart#success", as: "cart_success"
  get "/cart/cancel", to: "cart#cancel", as: "cart_cancel"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
