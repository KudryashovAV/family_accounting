class AddUserIdToIncomes < ActiveRecord::Migration
  def change
    add_reference :incomes, :user
  end
end
