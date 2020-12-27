# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :super_admins do
    get 'enterprises/index'

    resources :enterprises
  end

  get 'dashboard/index'
  
  devise_for :users
  root to: 'dashboard#index'
end
