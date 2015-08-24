class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :cost

  validates :product, presence: true
  validates :cost, presence: true
  validates :price, :weight, presence: true

  after_create :set_unit_price

  def set_unit_price
    update(unit_price: (price.to_f/weight.to_f).round(2))
  end
end
