Rails.application.routes.draw do
  devise_for :users
  root  'themes#index'
end
