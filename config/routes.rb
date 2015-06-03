Rails.application.routes.draw do
  root 'index#index'
  devise_for :members, controllers:  { omniauth_callbacks:  "members/omniauth_callbacks" }
  resources :members
  resource :profile, only: :show
  resources :communities
  resources :places
  resources :events
  resources :locations, only: [:index]
end
