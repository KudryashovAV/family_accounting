class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|

      t.decimal :price, precision: 12, scale: 2
      t.date :reporting_period
      t.string :description

      t.timestamps null: false
    end
  end
end
