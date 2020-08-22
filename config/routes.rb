Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt/ do
    devise_for :users

    resources :diets
    resources :weights

    root to: 'home#index'
  end
end
