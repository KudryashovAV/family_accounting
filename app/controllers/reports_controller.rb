class ReportsController < ApplicationController

  def index
    if params[:report]
      start_of_period = params[:report][:start].split('/')
      end_of_period = params[:report][:end].split('/')
      start_date = Date.new(start_of_period[2].to_i, start_of_period[1].to_i, start_of_period[0].to_i)
      end_date = Date.new(end_of_period[2].to_i, end_of_period[1].to_i, end_of_period[0].to_i)
      @incomes = Income.where('reporting_period >= ? AND reporting_period <= ?', start_date, end_date)
      @costs = Cost.where('created_at >= ? AND created_at <= ?', start_date, end_date)
    end
  end


end
