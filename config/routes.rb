# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
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
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy, :index]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end
