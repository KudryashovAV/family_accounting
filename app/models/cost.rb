class Cost < ActiveRecord::Base
  belongs_to :user
  
  has_many :purchases, inverse_of: :cost, dependent: :destroy
  has_many :products, through: :purchases

  accepts_nested_attributes_for :purchases, allow_destroy: true
end
