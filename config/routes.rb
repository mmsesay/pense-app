Rails.application.routes.draw do
  devise_for :users
 
  get '/transactions', to: 'entity#index'

  # Defines the root path route ("/")
  root "splash#index"
end
