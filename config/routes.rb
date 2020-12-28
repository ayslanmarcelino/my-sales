# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :super_admins do
    get 'enterprises/index'

    resources :enterprises
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
