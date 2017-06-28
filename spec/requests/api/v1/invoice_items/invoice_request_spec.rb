require 'rails_helper'

describe "GET /api/v1/invoice_items/:id/invoice" do
  it "reutrns the associated invoice for invoice item" do
    invoice_id = create(:invoice).id
    invoice_item = create(:invoice_item, invoice_id: invoice_id)
    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/invoice"

    expect(response).to be_success

    raw_invoice = JSON.parse(response.body)

    expect(raw_invoice["id"]).to eq(invoice_id)
    expect(raw_invoice).to have_key("customer_id")
    expect(raw_invoice).to have_key("merchant_id")
    expect(raw_invoice).to have_key("status")
  end
end
