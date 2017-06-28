require 'rails_helper'

describe "GET /api/v1/invoice_items/:id/item" do
  it "reutrns the associated item for invoice item" do
    item_id = create(:item).id
    invoice_item = create(:invoice_item, item_id: item_id)
    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/item"

    expect(response).to be_success

    raw_invoice = JSON.parse(response.body)

    expect(raw_invoice["id"]).to eq(item_id)
    expect(raw_invoice).to have_key("name")
    expect(raw_invoice).to have_key("description")
    expect(raw_invoice).to have_key("merchant_id")
    expect(raw_invoice).to have_key("unit_price")
  end
end
