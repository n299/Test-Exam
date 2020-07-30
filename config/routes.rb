# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  # Devise User
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
  end
  resources :users, only: %i[update]
  get 'user/profile', to: 'users#edit', as: 'profile'
  # Devise Admin
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  namespace :admins do
    root 'pages#index'
    resources :users
    resources :categories
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
