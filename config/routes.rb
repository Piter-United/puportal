Rails.application.routes.draw do
  scope '/', defaults: { format: 'html' } do
    devise_for :admins, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users, controllers: { omniauth_callbacks:  "users/omniauth_callbacks" }
  end

  scope '/', defaults: { format: 'json' } do
    resource :profile, only: :show
    resources :events

    resources :communities do
      resource :membership, only: [:create, :destroy], path_names: { create: 'join', destroy: 'leave' }
    end
  end
end
