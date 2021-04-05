# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'landing#index'

  get '/dashboard' => 'dashboard#show', as: :user_root

  namespace :admin do
    resources :users
  end
end
