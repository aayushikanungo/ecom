class User < ApplicationRecord
  has_many :products
  has_one :cart

  after_create :create_cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { buyer: 0, seller: 1, admin: 2 }
  
  def create_cart
    Cart.create(user_id: self.id)
  end
end
