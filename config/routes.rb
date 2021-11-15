Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root to: 'listings#index'
  get "/search", to: 'listings#search'
  get "/categories", to: 'listings#categories'
  get "/seller/:id", to: 'listings#seller', as: 'seller'
  get "/request_listing/:id", to: 'listings#request_listing', as: 'request_listing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
