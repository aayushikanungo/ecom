class AddCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.string :name
      t.integer :quantity
      t.integer :cart_id
    end
  end
end
