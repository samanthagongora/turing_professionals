Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:destroy]

  get '/dashboard', to: "dashboard#show"

  resources :contacts, only: [:create]

  get '/profile', to: "profile#show"

  resources :companies, only: [:index]
  resources :interview_questions, only: [:create]
  resources :locations, only: [:index]

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  root 'welcome#index'
  get '/:company', to: 'companies#show', as: :company

  namespace :admin do
    get '/dashboard', to: "dashboard#show"
    resources :users, only: [:update]
    resources :companies, only: [:destroy]
  end
end
