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

  resources :brands
  resources :collections
  resources :toys

  post '/toys/add_to_cart/:id', to: 'toys#add_to_cart', as: 'add_to_cart'
  post '/toys/update_cart/:id', to: 'toys#update_cart', as: 'update_cart'
  delete '/toys/remove_from_cart/:id', to: 'toys#remove_from_cart', as: 'remove_from_cart'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
