class Api::V1::InvoiceItems::FindController < ApplicationController

  before_action :convert_unit_price

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :unit_price, :invoice_id, :quantity, :created_at, :updated_at)
  end

  def convert_unit_price
    if params[:unit_price]
      params[:unit_price].sub!('.', '').to_i
    end
  end
end
