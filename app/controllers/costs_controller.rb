class CostsController < ApplicationController
  def index
    @costs = Cost.all.sort_by{|x| x.created_at}.group_by{|i| i.created_at.strftime('%B %Y')}
  end

  def show
    @cost = find_resource
  end

  private

  def find_resource
    Cost.find(params[:id])
  end
end
