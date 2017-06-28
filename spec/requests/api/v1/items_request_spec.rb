require 'rails_helper'
require 'pry'
describe "Items API" do

  context "GET /api/v1/index" do
    it "sends a list of items" do
      create_list(:merchant, 3)
      create_list(:item, 3)

      get '/api/v1/items'

      expect(response).to be_success

      raw_items = JSON.parse(response.body)
      raw_item = raw_items.first

      expect(raw_items.count).to eq(3)
      expect(raw_item).to have_key("name")
    end
  end

  context "GET /api/v1/show" do
    it "sends an individual item" do
      item = create(:item)
      id = item.id
      merchant_id = item.merchant_id

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
