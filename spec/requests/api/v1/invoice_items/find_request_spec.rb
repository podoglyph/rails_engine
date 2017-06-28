require 'rails_helper'

describe "InvoiceItems Finder API" do
  context "GET /api/v1/invoice_items/find?" do
    it "finds and returns single invoice_item by search params" do
      list = create_list(:invoice_item, 5)
      id = list.last.id

      get "/api/v1/invoice_items/find?id=#{id}"

      expect(response).to be_success

      raw_invoice_item = JSON.parse(response.body)

      expect(raw_invoice_item["id"]).to eq(id)
      expect(raw_invoice_item).to have_key("invoice_id")
      expect(raw_invoice_item).to have_key("quantity")
      expect(raw_invoice_item).to have_key("item_id")
      expect(raw_invoice_item).to have_key("unit_price")

    end
  end

  context "GET /api/v1/invoice_items/find_all?" do
    it "finds and returns all invoice_items by search params" do
      list = create_list(:invoice_item, 5)
      quantity = list.last.quantity

      get "/api/v1/invoice_items/find_all?quantity=#{quantity}"

      expect(response).to be_success

      raw_invoice_items = JSON.parse(response.body)
      raw_invoice_item = raw_invoice_items.first

      expect(raw_invoice_item).to have_key("invoice_id")
      expect(raw_invoice_item).to have_key("quantity")
      expect(raw_invoice_item).to have_key("item_id")
      expect(raw_invoice_item).to have_key("unit_price")
    end
  end
end
