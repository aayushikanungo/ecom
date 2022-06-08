class AddProductToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :cart, index: true
  end
end
