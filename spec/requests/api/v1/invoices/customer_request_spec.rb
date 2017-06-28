require 'rails_helper'

describe "GET /api/v1/invoices/:id/customer" do
  it "returns attached customer for invoice" do
    cust_id = create(:customer).id
    invoice = create(:invoice, customer_id: cust_id)
    id = invoice.id

    get "/api/v1/invoices/#{id}/customer"

    expect(response).to be_success

    raw_customer = JSON.parse(response.body)
    expect(raw_customer["id"]).to eq(cust_id)
    expect(raw_customer).to have_key("first_name")
    expect(raw_customer).to have_key("last_name")
  end
end
