class AddUserIdToCosts < ActiveRecord::Migration
  def change
    add_reference :costs, :user
  end
end
