Rails.application.routes.draw do
  devise_for :users
  root 'dreams#index'
end
