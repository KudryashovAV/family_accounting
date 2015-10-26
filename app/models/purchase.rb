class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :cost

  validates :product, presence: true
  validates :cost, presence: true
  validates :unit_price, :weight, presence: true

  before_save :set_price

  def set_price
    self.price = self.unit_price * self.weight
  end
end
