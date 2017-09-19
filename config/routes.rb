Rails.application.routes.draw do
  devise_for :users
  resources :themes do
    resources :opinions
  end
  root  'themes#index'
end
