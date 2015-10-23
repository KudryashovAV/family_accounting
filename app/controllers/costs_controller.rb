class CostsController < ApplicationController
  def index
    @costs = Cost.load_costs_for_period(params[:period].to_sym, params[:start], params[:end])
  end

  def show
    
  end

  def new
    @cost = Cost.new
  end

  def create
    if params[:cost]
      @cost = Cost.new(resource_params)
      exist_costs = Cost.where('created_at > ?', Date.today).first
      exist_costs ? save_or_update_cost(exist_costs.update(resource_params), :new) : save_or_update_cost(@cost.save, :new)
    else
      flash[:alert] = t('application.empty_cost')
      redirect_to new_cost_path
    end
  end

  def edit
    @cost = Cost.find(params[:id])
  end

  def update
    @cost = Cost.find(params[:id])
    save_or_update_cost(@cost.update(resource_params), :edit)
  end

  private

  def resource_params
    params.require(:cost).permit(purchases_attributes: [:id, :weight, :price, :product_id, :_destroy])
  end

  def save_or_update_cost(condition, render_to_action)
    if condition
      flash[:notice] = t('application.flash_created')
      redirect_to costs_path(period: :week, start: Date.today.beginning_of_week, end: Date.today.end_of_week)
    else
      flash[:alert] = t('application.error_created')
      render :new
    end
  end
end
