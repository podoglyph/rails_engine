class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    render json: most_revenue
  end

end
