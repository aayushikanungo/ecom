class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart.cart_items
  end
  
  def add_to_cart
    product = Product.find(params[:product_id])
    cart = current_user.cart
    item = cart.cart_items.where(product_id: product.id).first
    if item
      @cart_item = cart.cart_items.find_by(product_id: product.id)
      @cart_item.quantity += 1
    else
      values = { "name" => product.name, "quantity" => 1, "cart_id" => cart.id, "product_id" => product.id }
      @cart_item = CartItem.new(values)
    end
    redirect_to carts_path if @cart_item.save
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
