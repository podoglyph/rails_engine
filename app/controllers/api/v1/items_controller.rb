class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    # item.unit_price.to_s.insert(-3, '.')
    render json: item
  end

end
