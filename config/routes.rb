Rails.application.routes.draw do
  
  resources :stories do
  	collection do
  		get :lookup

  	end
  end

  root to: 'stories#index'
  
  devise_for :users
  
  resources :users

end
