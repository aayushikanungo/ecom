class CartsController < ApplicationController
  def index
    @cart_items = current_user.cart.cart_items
  end
  
  def add_to_cart
    product = Product.find(params[:product_id])
    cart = current_user.cart

    @cart_item = cart.cart_items.new(name: product.name, quantity: 1)
    @cart_item.save
    redirect_to carts_path
  end
end