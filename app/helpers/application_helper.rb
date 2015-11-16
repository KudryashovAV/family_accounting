module ApplicationHelper
  def search_period
    ((Date.today - 9.days)..Date.tomorrow).each_cons(2).to_a
  end

  def all_operation_from_period(collection)
    correct_collection = collection.flatten
    correct_collection.any? ? correct_collection.map(&:price).compact.reduce(&:+) : 0
  end

  def all_costs_from_period(costs)
    square = 0
    costs.each_value do |value|
      all_square = all_operation_from_period(value.map(&:purchases).flatten)
      square = square + all_square if all_square
    end
    square
  end

  def products_kind
    Product::PRODUCT_TYPES.map(&:humanize)
  end

  def sum_incomes_per_month(date)
    Income.incomes_per_month(date).map(&:price).reduce(&:+) || 0
  end
end
