class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(resource_params)
    if @cost.save
      flash[:notice] = t('application.flash_created')
      redirect_to :root
    else
      flash[:alert] = t('application.error_created')
      render :new
    end
  end

  private

  def resource_params
    params.require(:purchase).permit(:weight, :price)
  end
end
