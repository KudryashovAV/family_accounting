class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product
      t.references :cost

      t.decimal :weight, precision: 12, scale: 2
      t.decimal :price, precision: 12, scale: 2
      t.decimal :unit_price, precision: 12, scale: 2

      t.timestamps null: false
    end
  end
end
