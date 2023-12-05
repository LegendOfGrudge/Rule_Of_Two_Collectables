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

  resources :brands
  resources :collections
  resources :toys

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
