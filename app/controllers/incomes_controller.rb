class IncomesController < ApplicationController
  def index
    @incomes_per_current_month = Income.incomes_per_current_month
    @incomes = group_by_period(incomes_without_current_mont, :reporting_period, '%B %Y')
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(resource_params)
    if @income.save
      flash[:notice] = t('application.flash_created')
      redirect_to incomes_path
    else
      flash[:alert] = t('application.error_created')
      render :new
    end
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy
    flash[:notice] = t('application.element_destroyed')
    redirect_to incomes_path
  end

  private

  def resource_params
    params.require(:income).permit(:price, :description, :reporting_period)
  end

  def incomes_without_current_mont
    Income.all - @incomes_per_current_month
  end
end
