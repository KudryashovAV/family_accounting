class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product
      t.references :cost

      t.integer :weight
      t.integer :price
      t.decimal :unit_price, precision: 12, scale: 2

      t.timestamps null: false
    end
  end
end
