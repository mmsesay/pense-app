Rails.application.routes.draw do
  devise_for :users

  get '/group', to: 'group#index'
  get '/group/new', to: 'group#new'
  post '/group/new', to: 'group#create'
  get '/group/:id/transactions', to: 'group#show', as: :single_group
  get '/transactions', to: 'entity#index'
  get '/transactions/new', to: 'entity#new'
  post '/transactions/new', to: 'entity#create'

  # Defines the root path route ("/")
  root "splash#index"
end
