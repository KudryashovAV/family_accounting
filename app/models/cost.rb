class Cost < ActiveRecord::Base
  has_many :purchases, inverse_of: :cost, dependent: :destroy
  has_many :products, through: :purchases

  accepts_nested_attributes_for :purchases, allow_destroy: true

  DAYS_OF_WEEK = 7

  scope :costs_from_period, -> (start_of_period, end_of_period) {
    where('created_at >= ? AND created_at <= ?', start_of_period, end_of_period).order('created_at ASC')
  }

  #TODO use https://github.com/ankane/groupdate
  def self.load_costs_for_period(period = nil, start_of_period = nil, end_of_period = nil)
    case period
      when :week
        group_by_period(costs_from_period(start_of_period, end_of_period), '%A')
      when :month
        group_by_period(costs_from_period(start_of_period, end_of_period), '%B')
      when :year
        group_by_period(costs_from_period(start_of_period, end_of_period), '%B %Y')
      else
        group_by_period(Cost.all, '%B %Y')
    end
  end

  def self.group_by_period(collection, period)
    collection.group_by{|i| i.created_at.strftime(period)}
  end

end
