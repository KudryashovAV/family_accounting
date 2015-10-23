class Income < ActiveRecord::Base
  validates :price, :month, presence: true
end
