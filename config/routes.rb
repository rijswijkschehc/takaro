# frozen_string_literal: true

Rails.application.routes.draw do
  concern :sortable do
    collection do
      patch :reposition
    end
  end

  devise_for :users

  authenticated :user do
    root 'dashboard#show', as: :authenticated_root
  end

  root to: 'landing#index'

  get 'profile' => 'profile#show'
  patch 'profile' => 'profile#update'

  resources :periods, only: %i[show]
  resources :principles, only: %i[index show]

  namespace :admin do
    resources :periods
    resources :principles, concerns: %i[sortable]
    resources :techniques
    resources :static_pages
    resources :steps, concerns: %i[sortable]
    resources :target_categories
    resources :users
  end

  get '*path' => 'static_pages#show', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
