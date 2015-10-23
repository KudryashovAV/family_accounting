class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(resource_params)
    if @purchase.save
      flash[:notice] = t('application.flash_created')
      redirect_to costs_path(period: :week, start: Date.today.beginning_of_week, end: Date.today.end_of_week)
    else
      flash[:alert] = t('application.error_created')
      render partial: "form", locals: { product: Cost.find(resource_params[:cost_id]).purchases.build, cost_id: resource_params[:cost_id] }
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:notice] = t('application.purchase_destroyed')
    redirect_to costs_path(period: :week, start: Date.today.beginning_of_week, end: Date.today.end_of_week)
  end

  private

  def resource_params
    params.require(:purchase).permit(:weight, :price, :product_id, :cost_id)
  end
end
