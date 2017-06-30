class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def index
    render json: Merchant.find(params[:id]).customers_with_pending
  end

end
