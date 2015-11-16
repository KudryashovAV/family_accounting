namespace :db do
  desc 'Recalculate balance'
  task recalculate_balance: :environment do
    require 'recalculate_balance'
    Balance.destroy_all
    Balance.create(amount: 0)
    RecalculateBalance.add_transactions(Income, 1, -1)
    RecalculateBalance.add_transactions(Purchase, -1, 1)
    puts "Done. Current balance #{Balance.last.amount}"
  end
end
