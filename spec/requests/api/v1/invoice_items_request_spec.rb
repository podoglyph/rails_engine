require 'rails_helper'

describe "invoice_items API" do

  context "GET /api/v1/index" do
    it "sends a list of invoice items" do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'

      expect(response).to be_success

      raw_invoice_items = JSON.parse(response.body)
      raw_invoice_item = raw_invoice_items.first

      expect(raw_invoice_items.count).to eq(3)
      expect(raw_invoice_item).to have_key("invoice_id")
      expect(raw_invoice_item).to have_key("item_id")
      expect(raw_invoice_item).to have_key("unit_price")
    end
  end

  context "GET /api/v1/show" do
    xit "sends an individual invoice_item" do
      id = create(:invoice_item).id
      get "/api/v1/invoice_items/#{id}"

      expect(response).to be_success

      raw_invoice_item = JSON.parse(response.body)
      expect(raw_invoice_item["id"]).to eq(id)
      expect(raw_invoice_item).to have_key("invoice_id")
      expect(raw_invoice_item).to have_key("item_id")
      expect(raw_invoice_item).to have_key("unit_price")
    end
  end
end
