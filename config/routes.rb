Rails.application.routes.draw do

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:index]

  get '/auth/linkedin', as: :linkedin_login
  get '/auth/linkedin/callback', to: "sessions#create"

  root 'welcome#index'
end
