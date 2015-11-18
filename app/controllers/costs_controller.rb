class CostsController < ApplicationController
  def index
    @all_costs = group_by_period(current_user.costs, :created_at, '%B %Y')
    date = params[:date] || I18n.l(Date.today, format: '%B %Y')
    @current_period_costs = period_costs(@all_costs, date)
  end

  def show
    @cost = find_resource
  end

  def new
    @cost = current_user.costs.build
  end

  def create
    date_array = resource_params[:date].split('/')
    date = Date.new(date_array[2].to_i, date_array[1].to_i, date_array[0].to_i)
    exist_cost = current_user.costs.where('created_at > ?', date).first
    new_cost = current_user.costs.where('created_at > ?', date).first || current_user.costs.create(created_at: date)
    redirect_to exist_cost ? cost_path(id: exist_cost.id) : cost_path(id: new_cost.id)
  end

  private

  def resource_params
    params.require(:cost).permit(:date)
  end

  def find_resource
    current_user.costs.find(params[:id])
  end

  def period_costs(list, date)
    list.delete(date)
  end
end
