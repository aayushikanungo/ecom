Rails.application.routes.draw do
  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root "products#index"
  
  post 'cart_items/:id/add' => "carts#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "carts#reduce_quantity", as: "cart_item_reduce"
  # delete 'cart_items/:id' => "carts#destroy"
  delete 'cart_items/:id' => "carts#destroy", as: "cart_item_remove"
 
  post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  resources :products
  resources :categories
  resources :carts 
end
