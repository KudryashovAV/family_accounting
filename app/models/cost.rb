class Cost < ActiveRecord::Base
  has_many :purchases, inverse_of: :cost, dependent: :destroy
  has_many :products, through: :purchases

  accepts_nested_attributes_for :purchases, allow_destroy: true

  DAYS_OF_WEEK = 7
end
