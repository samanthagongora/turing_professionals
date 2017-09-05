Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:destroy]

  get '/dashboard', to: "dashboard#show"

  resources :contacts, only: [:create]

  get 'insights', to: 'insights#index'

  get '/profile', to: "profile#show"

  get "/filter_companies", to: "filter_companies#index"
  get "/order_companies", to: "order_companies#index"

  get "/filter_members", to: "filter_members#index"
  get "/order_members", to: "order_members#index"

  resources :companies, only: [:index]
  resources :interview_questions, only: [:create]

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  root 'welcome#index'
  get '/:company', to: 'companies#show', as: :company

  namespace :admin do
    get '/dashboard', to: "dashboard#show"
    resources :users, only: [:update]
    resources :companies, only: [:destroy]
  end

  delete '/favorite_users', to: 'favorite_users#destroy'
  post '/favorite_users', to: 'favorite_users#create'
  delete '/favorite_companies', to: 'favorite_companies#destroy'
  post '/favorite_companies', to: 'favorite_companies#create'
end
