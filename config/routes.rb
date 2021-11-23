Rails.application.routes.draw do
  devise_for :employers
  devise_for :charities
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'users#profile'
  resources :charities, only: %i[new create show] do
    resources :events, only: %i[new create show]
  end
  resources :events, only: %i[index show destroy edit update]
  resources :employers, only: %i[new create dashboard]
  resources :chatrooms, only: %i[show] do
    resources :messages, only: %i[create]
  end
  resources :bookings, only: %i[new create index destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
