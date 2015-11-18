namespace :db do
  desc 'Recalculate balance'
  task recalculate_balance: :environment do
    require 'recalculate_balance'
    RecalculateBalance.zero_balances
    RecalculateBalance.add_transactions(:incomes)
    RecalculateBalance.add_transactions(:purchases)
    puts "Done."
  end
end
