module ApplicationHelper
  def search_period
    ((Date.today - 9.days)..Date.tomorrow).each_cons(2).to_a
  end

  def all_costs_from_day(purchases)
    all_purchases = purchases.flatten
    all_purchases.any? ? all_purchases.map(&:price).compact.reduce(&:+) : 0
  end

  def all_costs_from_period(costs)
    square = 0
    costs.each_value do |value|
      all_square = all_costs_from_day(value.map(&:purchases).flatten)
      square = square + all_square if all_square
    end
    square
  end

end
