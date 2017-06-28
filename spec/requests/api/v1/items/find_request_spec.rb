require 'rails_helper'

describe "Items Finder API" do
  context "GET /api/v1/items/find?" do
    it "finds and returns single item by search params" do
      list = create_list(:item, 5)
      id = list.last.id

      get "/api/v1/items/find?id=#{id}"

      expect(response).to be_success

      raw_item = JSON.parse(response.body)

      expect(raw_item["id"]).to eq(id)
      expect(raw_item).to have_key("name")
      expect(raw_item).to have_key("description")
      expect(raw_item).to have_key("unit_price")
      expect(raw_item).to have_key("merchant_id")
    end
  end

  context "GET /api/v1/items/find_all?" do
    it "finds and returns all items by search params" do
      list = create_list(:item, 5)
      name = list.last.name

      get "/api/v1/items/find_all?name=#{name}"

      expect(response).to be_success

      raw_items = JSON.parse(response.body)
      raw_item = raw_items.first

      expect(raw_item).to have_key("name")
      expect(raw_item).to have_key("description")
      expect(raw_item).to have_key("unit_price")
      expect(raw_item).to have_key("merchant_id")
    end
  end
end
