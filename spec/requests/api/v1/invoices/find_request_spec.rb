require 'rails_helper'

describe "Invoices Finder API" do
  context "GET /api/v1/invoices/find?" do
    it "finds and returns single invoice by search params" do
      list = create_list(:invoice, 5)
      id = list.last.id

      get "/api/v1/invoices/find?id=#{id}"

      expect(response).to be_success

      raw_invoice = JSON.parse(response.body)

      expect(raw_invoice["id"]).to eq(id)
      expect(raw_invoice).to have_key("customer_id")
      expect(raw_invoice).to have_key("status")
      expect(raw_invoice).to have_key("merchant_id")

    end
  end

  context "GET /api/v1/invoices/find_all?" do
    it "finds and returns all invoices by search params" do
      list = create_list(:invoice, 5)
      status = list.last.status

      get "/api/v1/invoices/find_all?status=#{status}"

      expect(response).to be_success

      raw_invoices = JSON.parse(response.body)
      raw_invoice = raw_invoices.first

      expect(raw_invoice).to have_key("customer_id")
      expect(raw_invoice).to have_key("status")
      expect(raw_invoice).to have_key("merchant_id")
    end
  end
end
