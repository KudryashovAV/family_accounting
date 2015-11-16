class Income < ActiveRecord::Base
  validates :price, :reporting_period, presence: true
  validates :price, numericality: {
    less_than_or_equal_to: 9_999_999_999,
    greater_than_or_equal_to: 0,
    allow_blank: true
  }

  scope :incomes_per_month, ->(date) {
    where('reporting_period >= ? AND reporting_period <= ?', date.beginning_of_month, date.end_of_month).order('reporting_period ASC')
  }

end
