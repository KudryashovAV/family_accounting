class ReportsController < ApplicationController

  def index
    @report = ReportBuilder.build_report(params[:report]) if params[:report]
  end


end
