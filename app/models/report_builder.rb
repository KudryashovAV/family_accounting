class ReportBuilder

  def self.build_report(params)
    report = {}

    start_of_period = params[:start].split('/')
    end_of_period = params[:end].split('/')
    start_date = Date.new(start_of_period[2].to_i, start_of_period[1].to_i, start_of_period[0].to_i)
    end_date = Date.new(end_of_period[2].to_i, end_of_period[1].to_i, end_of_period[0].to_i)
    report[:incomes] = current_user.incomes.where('reporting_period >= ? AND reporting_period <= ?', start_date, end_date)
    report[:costs] = current_user.costs.where('created_at >= ? AND created_at <= ?', start_date, end_date)

    report
  end
end
