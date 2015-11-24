class User < ActiveRecord::Base
  include Identity::Mixins::User
  has_many :costs, inverse_of: :user, dependent: :destroy
  has_many :incomes, inverse_of: :user, dependent: :destroy
  has_many :balances, inverse_of: :user, dependent: :destroy
  has_many :purchases, inverse_of: :user, dependent: :destroy

  after_create :create_new_balance

  def create_new_balance
    self.balances.create(amount: 0)
  end
end
