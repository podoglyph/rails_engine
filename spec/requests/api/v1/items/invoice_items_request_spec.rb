require 'rails_helper'

describe "GET /api/v1/items/:id/invoice_items" do
  it "returns a collection of invoice items for item" do
    id = create(:item).id

    invoice_item_1 = create(:invoice_item, item_id: id)
    invoice_item_2 = create(:invoice_item, item_id: id)
    invoice_item_3 = create(:invoice_item, item_id: id)

    get "/api/v1/items/#{id}/invoice_items"

    expect(response).to be_success

    raw_invoice_items = JSON.parse(response.body)
    raw_invoice_item = raw_invoice_items.first

    expect(raw_invoice_items.count).to eq(3)
    expect(raw_invoice_item).to have_key("invoice_id")
    expect(raw_invoice_item).to have_key("item_id")
    expect(raw_invoice_item).to have_key("unit_price")
  end
end
