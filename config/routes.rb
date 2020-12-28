# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :super_admins do
    get 'enterprises/index'
    get 'users/index'

    resources :enterprises
    resources :users
  end

  namespace :admins do
    get 'users/index'
    get 'enterprises/index'

    resources :users
    resources :enterprises
  end

  get 'dashboard/index'

  devise_for :users
  root to: 'dashboard#index'
end
