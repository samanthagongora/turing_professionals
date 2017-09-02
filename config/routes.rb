Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:index]

  get '/auth/linkedin', as: :linkedin_login
  get '/auth/linkedin/callback', to: "sessions#create"

  root 'welcome#index'
  resources :companies, only: [:index, :show]

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

end
