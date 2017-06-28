require 'rails_helper'

describe "GET /api/v1/invoices/:id/merchants" do
  it "returns attached merchant for invoice" do
    merch_id = create(:merchant).id
    invoice = create(:invoice, merchant_id: merch_id)
    id = invoice.id

    get "/api/v1/invoices/#{id}/merchant"

    expect(response).to be_success

    raw_merchant = JSON.parse(response.body)

    expect(raw_merchant["id"]).to eq(merch_id)
    expect(raw_merchant).to have_key("name")
  end
end
