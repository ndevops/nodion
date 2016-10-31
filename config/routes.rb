Rails.application.routes.draw do


  namespace :admin do
  get 'ipblocks/index'
  end

  namespace :admin do
  get 'users/index'
  end

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'nodes#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :nodes do
    resources :access
  end
  resources :snapshots
  get 'api' => 'api#index', as: :api

  namespace :admin do
    resources :hypervisors
    resources :nodes
    resources :ipblocks
    resources :plans
    resources :regions
    resources :images
    resources :distributions
    resources :users
  end

end
