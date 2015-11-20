class Product < ActiveRecord::Base
  has_many :purchases, inverse_of: :product, dependent: :destroy
  has_many :costs, through: :purchases
  validates :name, presence: true, uniqueness: true

  PRODUCT_TYPES = %w(transport food communal_payments
                     entertainment sweets instruments
                     for_children other vegetables fruits
                     dairy_products clothes meat cereals
                     detergents hygiene_products)

  attr_accessor :additional_options

  after_create :capitalize_name

  def self.group_by_kind
    all.group_by{|product| product.kind}
  end

  def capitalize_name
    self.update(name: self.name.capitalize)
  end
end
