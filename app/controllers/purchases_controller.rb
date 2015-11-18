class PurchasesController < ApplicationController
  def new
    @purchase = current_user.purchases.build
  end

  def create
    @purchase = current_user.purchases.build(resource_params)
    if calculate_balance(@purchase)
      if @purchase.save
        flash[:notice] = t('application.flash_created')
        redirect_to cost_path(id: resource_params[:cost_id])
      else
        flash[:alert] = t('application.error_created')
        render :new
      end
    else
      flash[:alert] = t('application.error_balance')
      redirect_to incomes_path
    end
  end

  def destroy
    purchase = current_user.purchases.find(params[:id])
    cost = purchase.cost
    purchase.destroy
    current_user.balances.create(amount: (current_user.balances.last.amount + purchase.price))
    flash[:notice] = t('application.element_destroyed')
    redirect_to cost_path(id: cost.id)
  end

  private

  def resource_params
    params.require(:purchase).permit(:weight, :price, :product_id, :cost_id, :unit_price)
  end

  def calculate_balance(purchase)
    new_amount = current_user.balances.last.amount - purchase.set_price
    current_user.balances.create(amount: (new_amount)) if new_amount > 0
  end
end
