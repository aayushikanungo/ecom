class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :cart_item
  belongs_to :cart
end
