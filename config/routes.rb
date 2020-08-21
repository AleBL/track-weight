Rails.application.routes.draw do
  devise_for :users

  resources :diets
  resources :weights

  root to: 'home#index'
end
