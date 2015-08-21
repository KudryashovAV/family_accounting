class Product < ActiveRecord::Base
  has_many :purchases, inverse_of: :product, dependent: :destroy
  has_many :costs, through: :purchases
  validates :name, presence: true
end
