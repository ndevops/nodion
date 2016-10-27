Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'nodes#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :nodes

  namespace :admin do
    resources :hypervisors
    resources :nodes
    resources :plans
    resources :regions
    resources :images
    resources :distributions
  end

end
