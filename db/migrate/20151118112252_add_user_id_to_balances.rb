class AddUserIdToBalances < ActiveRecord::Migration
  def change
    add_reference :balances, :user
  end
end
