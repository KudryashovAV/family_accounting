class CostsController < ApplicationController
  def index
    @costs = group_by_period(Cost.all, :created_at, '%B %Y')
  end

  def show
    @cost = find_resource
  end

  private

  def find_resource
    Cost.find(params[:id])
  end
end
