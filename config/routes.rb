Rails.application.routes.draw do
  resources :events, only: %i[new create index]
  resources :users, only: %i[new create index]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
end
