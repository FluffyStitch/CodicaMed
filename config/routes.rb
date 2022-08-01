# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_for :doctors

  # root edit_registration_path

  root 'home#welcome'

  namespace :users do
    # get '/', to: '/devise/registrations#edit'
    # root to: '/devise/registrations#edit'
    # root to: 'users#edit'
    # root edit_registration_path
    resources :doctors, only: %i[index]
    resources :appointments, only: %i[index show new create]
  end

  namespace :doctors do
    # root edit_registration_path
    resources :users, only: %i[index]
    resources :appointments, only: %i[index show] do
      resources :recommendations, only: %i[new create]
    end
  end

  # resource :home, only: [] do
  #   get '/welcome', action: :welcome
  # end
end
