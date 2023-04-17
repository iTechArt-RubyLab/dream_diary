Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :dreams
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
