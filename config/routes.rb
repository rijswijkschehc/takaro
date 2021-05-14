# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'landing#index'

  get '/dashboard' => 'dashboard#show', as: :user_root

  namespace :admin do
    resources :static_pages
    resources :users
  end

  get '*path' => 'static_pages#show', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
