class AddCartItemToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :product, index: true
  end
end
