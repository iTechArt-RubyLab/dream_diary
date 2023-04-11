Rails.application.routes.draw do
  resources :dreams
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'dreams#index'
end
