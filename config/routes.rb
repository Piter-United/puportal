Rails.application.routes.draw do
  root 'index#index'
  devise_for :users, controllers:  { omniauth_callbacks:  "users/omniauth_callbacks" }
  resources :users
  resource :profile, only: :show

  resources :communities do
  	resource :membership, only: [:create, :destroy], path_names: { create: 'join', destroy: 'leave' }
  end

  resources :places
  resources :events
  resources :locations, only: [:index]
end
