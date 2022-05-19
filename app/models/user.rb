class User < ApplicationRecord
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { buyer: 0, seller: 1 }
  
end
