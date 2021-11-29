Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'users#profile'
  get 'details', to: 'pages#details'

  resources :charities, only: %i[create show] do
    resources :events, only: %i[new create]
  end
  resources :events, only: %i[index show destroy edit update] do
    resources :bookings, only: %i[new create]
  end
  resources :employers, only: %i[create dashboard]
  resources :volunteers, only: %i[create]
  resources :chatrooms, only: %i[show create] do
    resources :messages, only: %i[create]
  end
  resources :users, only: %i[] do
    patch '/accept/:id', to: 'invitations#accept', as: 'accept'
    patch '/decline/:id', to: 'invitations#decline', as: 'decline'
  end
  resources :bookings, only: %i[index destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
