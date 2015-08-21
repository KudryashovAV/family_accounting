class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product
      t.references :cost

      t.integer :weight
      t.integer :price

      t.timestamps null: false
    end
  end
end
