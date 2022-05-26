namespace :demo do
  desc "a new task to be executed"
  task my_task: :environment do
    products = Product.all
    products.each do |product|
      a = product.name
      b = product.id.to_s
      c = a +" "+ b
      puts c
      product.update(name: c)
    end
  # end
end