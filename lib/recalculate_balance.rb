module RecalculateBalance
  def self.add_transactions(associate)
    User.all.each do |user|
      user.send(associate).pluck(:price).each do |price|
        mod = associate == :incomes ? 1 : -1
        user.balances.create(amount: (user.balances.last.amount + price * mod))
      end
    end
  end

  def self.zero_balances
    User.all.each do |user|
      user.balances.destroy_all
      user.balances.create(amount: 0)
    end
  end
end
