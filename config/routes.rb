Rails.application.routes.draw do
  root to: 'static_page#new'
  #root to: 'users#sign_up' #'devise/sessions#new'
  devise_for :users
end
