Rails.application.routes.draw do
  root 'events#index'

  resources :users, only: [:new, :create] do
    resources :events
  end
  
  resources :events, only: [:show]
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
