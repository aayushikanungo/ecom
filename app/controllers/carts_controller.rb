class CartsController < ApplicationController
  before_action :authenticate_user!

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

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to carts_path
  end
  
  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to carts_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end  
end