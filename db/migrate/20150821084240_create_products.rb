class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.text    :description
      t.string  :manufacturer
      t.string  :kind
      t.integer :weight, default: 100
      t.integer :calories
      t.decimal :fats, precision: 12, scale: 6
      t.decimal :proteins, precision: 12, scale: 6
      t.decimal :carbohydrates, precision: 12, scale: 6
      t.decimal :vitamin_a, precision: 12, scale: 6
      t.decimal :vitamin_b1, precision: 12, scale: 6
      t.decimal :vitamin_b2, precision: 12, scale: 6
      t.decimal :vitamin_b3, precision: 12, scale: 6
      t.decimal :vitamin_b4, precision: 12, scale: 6
      t.decimal :vitamin_b5, precision: 12, scale: 6
      t.decimal :vitamin_b6, precision: 12, scale: 6
      t.decimal :vitamin_b7, precision: 12, scale: 6
      t.decimal :vitamin_b9, precision: 12, scale: 6
      t.decimal :vitamin_b10, precision: 12, scale: 6
      t.decimal :vitamin_b11, precision: 12, scale: 6
      t.decimal :vitamin_b12, precision: 12, scale: 6
      t.decimal :vitamin_b13, precision: 12, scale: 6
      t.decimal :vitamin_b15, precision: 12, scale: 6
      t.decimal :vitamin_c, precision: 12, scale: 6
      t.decimal :vitamin_d, precision: 12, scale: 6
      t.decimal :vitamin_e, precision: 12, scale: 6
      t.decimal :vitamin_k, precision: 12, scale: 6
      t.decimal :vitamin_n, precision: 12, scale: 6
      t.decimal :vitamin_p, precision: 12, scale: 6
      t.decimal :vitamin_u, precision: 12, scale: 6
      t.decimal :calcium, precision: 12, scale: 6
      t.decimal :iron, precision: 12, scale: 6
      t.decimal :potassium, precision: 12, scale: 6
      t.decimal :copper, precision: 12, scale: 6
      t.decimal :manganese, precision: 12, scale: 6
      t.decimal :magnesium, precision: 12, scale: 6
      t.decimal :sodium, precision: 12, scale: 6
      t.decimal :sulfur, precision: 12, scale: 6
      t.decimal :silicon, precision: 12, scale: 6
      t.decimal :zinc, precision: 12, scale: 6
      t.decimal :selenium, precision: 12, scale: 6
      t.decimal :chrome, precision: 12, scale: 6
      t.decimal :iodine, precision: 12, scale: 6

      t.timestamps null: false
    end
  end
end
