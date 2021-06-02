# frozen_string_literal: true

Rails.application.routes.draw do
  concern :sortable do
    collection do
      patch :reposition
    end
  end

  devise_for :users

  root to: 'landing#index'

  get '/dashboard' => 'dashboard#show', as: :user_root

  namespace :admin do
    resources :periods
    resources :principles, concerns: %i[sortable]
    resources :techniques
    resources :static_pages
    resources :steps
    resources :target_categories
    resources :users
  end

  get '*path' => 'static_pages#show', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
