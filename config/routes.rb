Rails.application.routes.draw do
  devise_for :users
  resources :themes do
    resources :opinions do
      resources :assessments
    end
  end
  root  'themes#index'
end
