FactoryGirl.define do
  factory :income do
    price {rand(10000 + rand(2)) / 10.to_f}
    reporting_period {Date.today}
  end
end
