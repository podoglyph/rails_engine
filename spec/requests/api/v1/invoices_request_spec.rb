require 'rails_helper'

describe "Invoices API" do

  context "GET /api/v1/index" do
    it "sends a list of invoices" do
      create_list(:invoice, 3)

      get '/api/v1/invoices'

      expect(response).to be_success

      raw_invoices = JSON.parse(response.body)
      raw_invoice = raw_invoices.first

      expect(raw_invoices.count).to eq(3)
      expect(raw_invoice).to have_key("merchant_id")
    end
  end

  context "GET /api/v1/show" do
    xit "sends an individual item" do
      id = create(:item).id
      get "/api/v1/items/#{id}"

      expect(response).to be_success

      raw_item = JSON.parse(response.body)
      expect(raw_item["id"]).to eq(id)
      expect(raw_item).to have_key("name")
      expect(raw_item).to have_key("description")
      expect(raw_item).to have_key("unit_price")
      expect(raw_item).to have_key("merchant_id")
    end
  end
end
