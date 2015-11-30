class PlannedCost < ActiveRecord::Base
  belongs_to :user

  scope :not_paid, -> { where(paid: false) }

  PLANNED_COST_TYPES = %w(Travel Clothes Tithe)

end
