Rails.application.routes.draw do
  resources :stories

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
