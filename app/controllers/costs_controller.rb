class CostsController < ApplicationController
  def index
    @costs = Cost.where('created_at >= ? AND created_at <= ?', params[:start_week], params[:end_week]).order('created_at ASC')
  end

  def new
    @cost = Cost.new
  end

  def create
    @cost = Cost.new(resource_params)
    exist_costs = Cost.where('created_at > ? AND created_at < ?', Date.yesterday, Date.tomorrow).map(&:created_at).map{|x| x.strftime("%A")}
    unless exist_costs.include?(Date.today.strftime("%A"))
      if @cost.save
        flash[:notice] = t('application.flash_created')
        redirect_to costs_path(start_week: Date.today.beginning_of_week, end_week: Date.today.end_of_week)
      else
        flash[:alert] = t('application.error_created')
        render :new
      end
    else
      flash[:notice] = t('application.exist_costs')
      redirect_to costs_path(start_week: Date.today.beginning_of_week, end_week: Date.today.end_of_week)
    end
  end

  def edit
    @cost = Cost.find(params[:id])
  end

  def update
    @cost = Cost.find(params[:id])
    if @cost.update(resource_params)
      flash[:notice] = t('application.flash_created')
      redirect_to costs_path(start_week: Date.today.beginning_of_week, end_week: Date.today.end_of_week)
    else
      flash[:alert] = t('application.error_created')
      render :edit
    end
  end

  private

  def resource_params
    params.require(:cost).permit(purchases_attributes: [:id, :weight, :price, :product_id, :_destroy])
  end
end
