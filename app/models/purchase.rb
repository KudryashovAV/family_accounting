class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :cost

  validates :product, presence: true
  validates :cost, presence: true
  validates :unit_price, :weight, presence: true
  validates :unit_price, numericality: {
    less_than_or_equal_to: 9_999_999,
    greater_than_or_equal_to: 0,
    allow_blank: true
  }
  validates :weight, numericality: {
    less_than_or_equal_to: 999,
    greater_than_or_equal_to: 0,
    allow_blank: true
  }

  before_save :set_price

  def set_price
    self.price = self.unit_price * self.weight
  end
end
