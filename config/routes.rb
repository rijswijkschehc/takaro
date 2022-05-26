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

  resources :comments do
    post :reload, on: :member
    resources :comments, module: :comments
  end
  resources :periods, only: %i[index show]
  resources :principles, only: %i[index show]
  resources :steps, only: %i[index]
  resources :teams, only: %i[show]
  resources :trainings do
    resources :comments, module: :trainings
  end
  resources :exercises do
    resources :comments, module: :exercises
  end

  namespace :admin do
    namespace :equipment do
      resources :locations, concerns: %i[sortable]
      resources :locks
    end
    resource :equipment
    resources :periods
    resources :principles, concerns: %i[sortable]
    resources :techniques
    resources :static_pages
    resources :static_sections
    resources :steps, concerns: %i[sortable]
    resources :target_categories
    resources :users
  end

  get '*path' => 'static_pages#show', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
