class CartsController < ApplicationController
  def index
    @carts = Carts.all
  end

  def add_to_cart(product)
    debugger
  end
end
