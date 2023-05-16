require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  constraints ->(request) { request.env['warden'].user&.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end
  mount Sidekiq::Web => '/sidekiq'

  root 'dreams#index'

  resources :categories, only: %i[index show]

  resources :dreams do
    resources :comments, only: %i[new create]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }
  resources :users, only: %i[show edit update]
end
