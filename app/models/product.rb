class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :cart
  
  has_many :cart_item
  has_many_attached :avatar
end
