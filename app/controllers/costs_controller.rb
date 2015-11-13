class CostsController < ApplicationController
  def index
    all_costs = group_by_period(Cost.all, :created_at, '%B %Y')
    @current_period_costs = all_costs.delete(I18n.l(Date.today, format: '%B %Y'))
    @costs = all_costs
  end

  def show
    @cost = find_resource
  end

  private

  def find_resource
    Cost.find(params[:id])
  end
end
