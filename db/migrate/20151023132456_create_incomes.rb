class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|

      t.decimal :price, precision: 12, scale: 2
      t.string :month
      t.string :description

      t.timestamps null: false
    end
  end
end
