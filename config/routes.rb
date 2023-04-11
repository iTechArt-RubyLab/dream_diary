Rails.application.routes.draw do
  devise_for :users
  resources :dreams
  root 'dreams#index'
end
