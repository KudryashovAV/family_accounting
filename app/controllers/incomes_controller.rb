class IncomesController < ApplicationController
  def index
    @incomes_per_current_month = current_user.incomes.incomes_per_month(Date.today)
    @incomes = group_by_period(incomes_without_current_mont, :reporting_period, '%B %Y')
  end

  def new
    @income = current_user.incomes.build
  end

  def create
    @income = current_user.incomes.build(resource_params)
    if @income.save
      current_user.balances.create(amount: (current_user.balances.last.amount + @income.price))
      current_user.planned_costs.create(planned_price: (@income.price * 0.1), planned_period: @income.reporting_period, kind: 'Tithe')
      flash[:notice] = t('application.flash_created')
      redirect_to incomes_path
    else
      flash[:alert] = t('application.error_created')
      render :new
    end
  end

  def destroy
    income = current_user.incomes.find(params[:id])
    income.destroy
    current_user.balances.create(amount: (current_user.balances.last.amount - income.price))
    flash[:notice] = t('application.element_destroyed')
    redirect_to incomes_path
  end

  private

  def resource_params
    params.require(:income).permit(:price, :description, :reporting_period)
  end

  def incomes_without_current_mont
    current_user.incomes - @incomes_per_current_month
  end
end
