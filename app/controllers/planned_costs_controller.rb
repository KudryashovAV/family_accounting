class PlannedCostsController < ApplicationController
  def edit
    @planned_cost = current_user.planned_costs.find(params[:id])
  end
  def update
    @planned_cost = current_user.planned_costs.find(params[:id])
    if @planned_cost.update(resource_params)
      if @planned_cost.paid?
        current_cost = current_user.costs.where('created_at > ?', Date.today).first || current_user.costs.create
        purchase = current_user.purchases.create(cost_id: current_cost.id,
                                      product_id: Product.find_or_create_by(name: @planned_cost.kind, kind: @planned_cost.kind).id,
                                      weight: 1,
                                      unit_price: @planned_cost.real_price || @planned_cost.planned_price)
        current_user.balances.create(amount: (current_user.balances.last.amount - purchase.price))
        @planned_cost.destroy
      end
      flash[:notice] = t('application.flash_created')
      redirect_to :root
    else
      flash[:alert] = t('application.error_created')
      render :edit
    end
  end

  private

  def resource_params
    params.require(:planned_cost).permit(:real_price, :real_period, :planned_price, :planned_period, :paid, :description, :kind)
  end
end
