Rails.application.routes.draw do
  root 'categories#index'

  resources :categories, only: %i[index show] do
    resources :dreams, only: %i[show destroy]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
