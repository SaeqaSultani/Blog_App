# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'comments/new'
  # get 'comments/create'
  # get 'likes/new'
  # get 'likes/create'
  # get 'like/new'
  # get 'like/create'
  # get 'comment/new'
  # get 'comment/create'
  # get 'posts/index'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: [:show,:index] do    
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
         end   
      end
end
