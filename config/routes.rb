Rails.application.routes.draw do
  root 'index#index'
  devise_for :users, controllers:  { omniauth_callbacks:  "users/omniauth_callbacks" }
  resources :users
  resource :profile, only: :show
  resources :communities
  resources :places
  resources :events
  resources :locations, only: [:index]
end
