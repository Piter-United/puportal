Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks:  "users/omniauth_callbacks" }

  scope format: true, constraints: { format: :json } do
    resource :profile, only: :show
    resources :events
    resources :communities do
      resource :membership, only: [:create, :destroy], path_names: { create: "join", destroy: "leave" }
    end
    resources :users, only: [:index, :show], controller: :people
    resources :partners, only: [:index]
  end

  root to: "application#angular"
  get "*path" => "application#angular"
end
