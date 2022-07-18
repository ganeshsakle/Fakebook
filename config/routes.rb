# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'posts#index'
  get 'home', to: 'static_page#new'

  get '/users', to: 'static_page#index'
  get '/user', to: 'static_page#show'
  # get '/static_page/index',to: 'static_page#index', as: '/users'
  # get '/static_page/:id', to: 'static_page#show', as: '/user'

  devise_for :users, controllers: {  confirmations: 'users/confirmations' , omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :notifications
  resources :comments
  resources :friends

  resources :posts do
    resources :comments
  end

  resources :posts, shallow: true do
    resources :likes, only: %i[create destroy]
  end
end
