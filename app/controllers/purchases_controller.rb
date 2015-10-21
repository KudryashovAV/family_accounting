class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(resource_params)
    if @purchase.save
      flash.now[:notice] = t('application.flash_created')
    else
      flash.now[:alert] = t('application.error_created')
      render partial: "form", locals: { product: Cost.find(resource_params[:cost_id]).purchases.build, cost_id: resource_params[:cost_id] }
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash.now[:notice] = t('applicationpurchase_destroyed')
  end

  private

  def resource_params
    params.require(:purchase).permit(:weight, :price, :product_id, :cost_id)
  end
end
