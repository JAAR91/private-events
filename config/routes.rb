Rails.application.routes.draw do
  root 'event#index'

  resources :user, only: [:new, :create] do
    resources :event
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :event
end
