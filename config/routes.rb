# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  concern :sortable do
    collection do
      patch :reposition
    end
  end

  authenticate :user, ->(u) { u.role?(:superuser, :administrator) } do
    mount Sidekiq::Web => 'admin/sidekiq'
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
  resources :trainings

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
