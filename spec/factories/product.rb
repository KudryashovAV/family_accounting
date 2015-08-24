FactoryGirl.define do
  factory :product do
    name {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence}
    manufacturer {Faker::Company.name}
    kind {Faker::Commerce.department}
    calories {rand(10000 + rand(2)) / 10.to_f}
    fats {rand(1000 + rand(2)) / 10.to_f}
    proteins {rand(1000 + rand(2)) / 10.to_f}
    carbohydrates {rand(1000 + rand(2)) / 10.to_f}
    vitamin_a {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b1 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b2 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b3 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b4 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b5 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b6 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b7 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b9 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b10 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b11 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b12 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b13 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_b15 {rand(100 + rand(2)) / 1000.to_f}
    vitamin_c {rand(100 + rand(2)) / 1000.to_f}
    vitamin_d {rand(100 + rand(2)) / 1000.to_f}
    vitamin_e {rand(100 + rand(2)) / 1000.to_f}
    vitamin_k {rand(100 + rand(2)) / 1000.to_f}
    vitamin_n {rand(100 + rand(2)) / 1000.to_f}
    vitamin_p {rand(100 + rand(2)) / 1000.to_f}
    vitamin_u {rand(100 + rand(2)) / 1000.to_f}
    calcium {rand(100 + rand(2)) / 1000.to_f}
    iron {rand(100 + rand(2)) / 1000.to_f}
    potassium {rand(100 + rand(2)) / 1000.to_f}
    copper {rand(100 + rand(2)) / 1000.to_f}
    manganese {rand(100 + rand(2)) / 1000.to_f}
    magnesium {rand(100 + rand(2)) / 1000.to_f}
    sodium {rand(100 + rand(2)) / 1000.to_f}
    sulfur {rand(100 + rand(2)) / 1000.to_f}
    silicon {rand(100 + rand(2)) / 1000.to_f}
    zinc {rand(100 + rand(2)) / 1000.to_f}
    selenium {rand(100 + rand(2)) / 1000.to_f}
    chrome {rand(100 + rand(2)) / 1000.to_f}
    iodine {rand(100 + rand(2)) / 1000.to_f}
  end
end
