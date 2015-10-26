class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cost

  def current_cost
    @current_cost = Cost.where('created_at > ?', Date.today).first || Cost.create
  end

  def group_by_period(collection, attribute, period)
    collection.sort_by{|x| x.send(attribute)}.reverse.group_by{|i| i.send(attribute).strftime(period)}
  end
end
