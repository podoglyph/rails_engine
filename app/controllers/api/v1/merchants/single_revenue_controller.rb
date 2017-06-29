class Api::V1::Merchants::SingleRevenueController < ApplicationController

  def show
    render json: Merchant.find(params[:id]).revenue(datetime), serializer: RevenueSerializer
  end

  private

  def datetime
    params[:date] if params[:date]
  end

end
