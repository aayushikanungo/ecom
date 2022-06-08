namespace :update_items do
  desc "Update cart items"
  task my_task: :environment do
    CartItem.all.each do |c_item|
      product = Product.find_by(name:c_item.name)
      c_item.update(product_id: product.id)
    end
  end
end
