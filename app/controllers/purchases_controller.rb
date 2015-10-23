class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(resource_params)
    if @purchase.save
      flash[:notice] = t('application.flash_created')
      redirect_to cost_path(id: resource_params[:cost_id])
    else
      flash[:alert] = t('application.error_created')
      render :new
    end
  end

  def destroy
    purchase = Purchase.find(params[:id])
    cost = purchase.cost
    purchase.destroy
    flash[:notice] = t('application.element_destroyed')
    redirect_to cost_path(id: cost.id)
  end

  private

  def resource_params
    params.require(:purchase).permit(:weight, :price, :product_id, :cost_id)
  end
end
