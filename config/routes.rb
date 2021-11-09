Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root to: 'listings#index'
  get "/search", to: 'listings#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
