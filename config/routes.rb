# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'posts#index'
  get 'home', to: 'static_page#new'

  get '/static_page/index'
  get '/static_page/show'

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
