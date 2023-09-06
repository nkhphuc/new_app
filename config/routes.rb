# frozen_string_literal: true

Rails.application.routes.draw do
  resources :inventories
  resources :categories
  resources :products
  resources :blogs
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
