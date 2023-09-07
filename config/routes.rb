# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  post 'auth/login', to: 'authentication#login'

  resources :trains, :stations, :parcels , :users
end
