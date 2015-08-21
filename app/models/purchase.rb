class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :cost

  validates :product, presence: true
  validates :cost, presence: true
end
