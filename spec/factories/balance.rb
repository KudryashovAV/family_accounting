FactoryGirl.define do
  factory :balance do
    user { create(:user) }
    amount {rand(100 + rand(2)) / 1000.to_f}
  end
end
