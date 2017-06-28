require 'rails_helper'

describe "GET /api/v1/items/:id/merchants" do
  it "returns a collection of invoice items for item" do
    merch_id = create(:merchant).id
    item = create(:item, merchant_id: merch_id)
    id = item.id

    get "/api/v1/items/#{id}/merchant"

    expect(response).to be_success

    raw_merchant = JSON.parse(response.body)

    expect(raw_merchant["id"]).to eq(merch_id)
    expect(raw_merchant).to have_key("name")
  end
end
