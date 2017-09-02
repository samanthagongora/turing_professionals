Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users

  get '/dashboard', to: "dashboard#show"


  resources :companies, only: [:index]

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  root 'welcome#index'
end

# get '/auth/linkedin', as: :linkedin_login
# get '/auth/linkedin/callback', to: "sessions#create"
