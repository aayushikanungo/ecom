class GenerateProductJob < ApplicationJob
  queue_as :default

  def perform(product, params)
    product.update(params)
  end
end
