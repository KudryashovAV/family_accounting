module ApplicationHelper
  def search_period
    ((Date.today - 9.days)..Date.tomorrow).each_cons(2).to_a
  end
end
