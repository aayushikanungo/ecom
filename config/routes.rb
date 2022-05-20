Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  
  post '/add_to_cart/', to: 'carts#add_to_cart'
  resources :products
  resources :categories
  resources :carts
end
