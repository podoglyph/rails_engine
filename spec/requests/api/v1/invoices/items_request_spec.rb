require 'rails_helper'

describe "GET /api/v1/invoices/:id/items" do
  it "returns a collection of items for invoice" do
    id = create(:invoice).id

    item_1 = create(:item, invoice_id: id)
    item_2 = create(:item, invoice_id: id)
    item_3 = create(:item, invoice_id: id)

    invoice_item_1 = create(:invoice_item, invoice_id: id, item_id: item_1.id)
    invoice_item_2 = create(:invoice_item, invoice_id: id, item_id: item_2.id)
    invoice_item_3 = create(:invoice_item, invoice_id: id, item_id: item_3.id)

    get "/api/v1/invoices/#{id}/items"

    expect(response).to be_success

    raw_items = JSON.parse(response.body)
    raw_item = raw_items.first

    expect(raw_items.count).to eq(3)
    expect(raw_item).to have_key("name")
    expect(raw_item).to have_key("description")
    expect(raw_item).to have_key("unit_price")
  end
end
