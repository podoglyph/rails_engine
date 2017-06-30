class Api::V1::Items::FindController < ApplicationController

  before_action :convert_unit_price

  def index
    render json: Item.where(item_params)
  end

  def show
    if item_params[:created_at] || item_params[:updated_at]
      item = Item.where(item_params).first
      render json: item
    else
      render json: Item.find_by(item_params)
    end
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

  def convert_unit_price
    if params[:unit_price]
      params[:unit_price].sub!('.', '').to_i
    end
  end

end
