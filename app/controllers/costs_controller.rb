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
    binding.pry
    cost = current_user.costs.where('created_at > ? AND created_at < ?', date, date.tomorrow).first || current_user.costs.create(created_at: date)
    redirect_to cost_path(id: cost.id)
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
