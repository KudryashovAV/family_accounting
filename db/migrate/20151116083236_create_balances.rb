class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :amount, precision: 12, scale: 2

      t.timestamps null: false
    end
  end
end
