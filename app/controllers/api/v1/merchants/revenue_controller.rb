class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    binding
    render json: Merchant.revenue_by_date(params[:date]), serializer: RevenueByDateSerializer
  end

end
