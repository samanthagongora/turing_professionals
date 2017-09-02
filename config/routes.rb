Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create, :edit, :update]
  #
  # get '/auth/linkedin', as: :linkedin_login
  # get '/auth/linkedin/callback', to: "sessions#create"

  resources :companies, only: [:index]

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  get '/dashboard', to: 'users#show'


end
