require 'sidekiq/web'

Rails.application.routes.draw do
  get 'rails/s'
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services
      resources :donorforms
      resources :donations

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :donorforms do
    resources :donations
  end
  resources :users, only: :show

  root to: 'donorforms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
