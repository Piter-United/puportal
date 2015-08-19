Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks:  "users/omniauth_callbacks" }

  resource :profile, only: :show

  resources :communities do
  	resource :membership, only: [:create, :destroy], path_names: { create: 'join', destroy: 'leave' }
  end

  resources :events
end
