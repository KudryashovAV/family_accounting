class CreatePlannedCosts < ActiveRecord::Migration
  def change
    create_table :planned_costs do |t|

      t.references :user
      t.decimal :planned_price, precision: 12, scale: 2
      t.decimal :real_price, precision: 12, scale: 2
      t.date :planned_period
      t.date :real_period
      t.string :description
      t.string :kind
      t.boolean :paid, default: false
    end
  end
end
