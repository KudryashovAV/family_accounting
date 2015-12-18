class ReportsController < ApplicationController

  def index
    @balances = current_user.balances.where('created_at >= ? AND created_at <= ?', Date.today.beginning_of_month, Date.today.end_of_month)
    @costs = current_user.costs.where('created_at >= ? AND created_at <= ?', Date.today.beginning_of_month, Date.today.end_of_month)
  end


end
