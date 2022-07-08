Rails.application.routes.draw do
  # get 'friends/new'
  # get 'friends/edit'
  # get 'friends/index'
  # get 'friends/save'
  # get 'friends/update'
  # get 'friends/destroy'
  # get 'comments/new'
  # get 'comments/edit'
  # get 'comments/index'
  # get 'comments/save'
  # get 'comments/update'
  # get 'comments/destroy'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/index'
  # get 'posts/save'
  # get 'posts/update'
  # get 'posts/destroy'
  root to: 'posts#index'
  get 'home', to: 'static_page#new'

  #root to: 'users#sign_up' #'devise/sessions#new'
  # get 'profile' , to: 'static_page#index'
  # get 'profile/:id', to: 'static_page#show'
  get '/static_page/index'
  get '/static_page/show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :notifications
  resources :comments
  resources :friends


  resources :posts do 
    resources :comments
  end
  
  resources :posts, shallow: true do
    resources :likes, only: [:create, :destroy]
  end

end
