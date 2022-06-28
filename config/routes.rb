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
  root to: 'static_page#new'
  #root to: 'users#sign_up' #'devise/sessions#new'
  devise_for :users
  resources :posts
  resources :comments
  resources :friends
end
