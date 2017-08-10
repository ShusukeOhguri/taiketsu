Rails.application.routes.draw do
  devise_for :users
  resources :themes
  root  'themes#index'
end
