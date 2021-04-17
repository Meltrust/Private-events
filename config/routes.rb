Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/enrollment', to: 'enrollments#post'

  resources :events, only: %i[show new create index]
  resources :users, only: %i[show new create index]
end
