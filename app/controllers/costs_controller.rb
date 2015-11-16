class CostsController < ApplicationController
  def index
    @all_costs = group_by_period(Cost.all, :created_at, '%B %Y')
    date = params[:date] || I18n.l(Date.today, format: '%B %Y')
    @current_period_costs = period_costs(@all_costs, date)
  end

  def show
    @cost = find_resource
  end

  private

  def find_resource
    Cost.find(params[:id])
  end

  def period_costs(list, date)
    list.delete(date)
  end
end
