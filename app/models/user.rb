class User < ApplicationRecord
  has_many :products
  has_one :cart

  after_create :create_cart
  before_destroy :update_seller
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { buyer: 0, seller: 1, admin: 2 }
  
  def create_cart
    Cart.create(user_id: self.id)
  end

  def update_seller
    if self.seller?
      seller = User.where(role: "seller").and(User.where.not(id: self.id)).first
      self.products.update_all(user_id: seller.id) if self.products.any?
    end
  end
end
