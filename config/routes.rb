Rails.application.routes.draw do
  resources :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :events, only: %i[new create index]
end
