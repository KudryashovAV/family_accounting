class CostsController < ApplicationController
  def index
    @costs = Cost.where('created_at >= ? AND created_at <= ?', params[:start_week], params[:end_week]).order('created_at ASC')
  end

  def new
    @cost = Cost.new
  end

  def create
    @cost = Cost.new(resource_params)
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
    params.require(:cost).permit(purchases_attributes: [:id, :weight, :price, :product_id, :_destroy])
  end
end
