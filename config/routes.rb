# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|vi/ do
    root 'home#index'

    # Devise User
    devise_for :users, controllers: { sessions: 'users/sessions' }
    devise_scope :user do
      get 'login', to: 'users/sessions#new'
    end
    resources :users, only: %i[update]
    resources :exams, only: %i[index show]
    resources :user_exams do
      member do
        get :exam_start
      end
    end
    get 'user/profile', to: 'users#edit', as: 'profile'

    # Devise Admin
    devise_for :admins, controllers: { sessions: 'admins/sessions' }
    namespace :admins do
      root 'pages#index'
      resources :users
      resources :categories
      resources :exams
      resources :user_exams, only: %i[index show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
