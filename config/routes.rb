Rails.application.routes.draw do
  devise_for :users

  get '/group', to: 'group#index'
  get '/group/:id/transactions', to: 'group#show'
  get '/transactions', to: 'entity#index'

  # Defines the root path route ("/")
  root "splash#index"
end
