Rails.application.routes.draw do
  get 'welcome/index'
  get '/auth/linkedin', as: :linkedin_login
  get '/auth/linkedin/callback', to: "sessions#create"
  root 'welcome#index'
end
