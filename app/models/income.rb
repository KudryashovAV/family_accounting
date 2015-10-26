class Income < ActiveRecord::Base
  validates :price, :reporting_period, presence: true

  scope :incomes_per_current_month, -> {
    where('reporting_period >= ? AND reporting_period <= ?', Date.today.beginning_of_month, Date.today.end_of_month).order('reporting_period ASC')
  }

end
