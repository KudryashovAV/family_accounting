class Product < ActiveRecord::Base
  has_many :purchases, inverse_of: :product, dependent: :destroy
  has_many :costs, through: :purchases
  validates :name, presence: true

  PRODUCT_TYPES = %w(transport food  communal_payments
                     entertainment sweets instruments
                     for_children other)

  attr_accessor :additional_options

end
