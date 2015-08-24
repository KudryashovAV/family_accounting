module ApplicationHelper
  def search_period
    ((Date.today - 9.days)..Date.tomorrow).each_cons(2).to_a
  end

  def all_costs_from_day(purchases)
    purchases.any? ? purchases.map(&:price).reduce(&:+) : 0
  end

  def all_costs_from_week(costs)
    all_costs_from_day(costs.map(&:purchases).flatten)
  end
end
