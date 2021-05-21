Rails.application.routes.draw do
  root 'events#index'

  resources :users, only: %i[new create show index] do
    resources :events do
      resources :attendees
    end
  end

  resources :events, only: [:show] do
    resources :attendees, only: [:edit, :update]
  end

  get '/invites', to: 'attendees#create'
  post '/invites', to: 'attendees#create'
  get '/invitesdel', to: 'attendees#destroy'
  post '/invitesdel', to: 'attendees#destroy'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
