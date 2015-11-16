module RecalculateBalance
  def self.add_transactions(model, mod1, mod2)
    model.pluck(:price).each do |price|
      price = price > 0 ? price * mod1 : price * mod2
      Balance.create(amount: (Balance.last.amount + price))
    end
  end
end
