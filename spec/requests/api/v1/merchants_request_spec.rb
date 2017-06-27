require 'rails_helper'

describe "Merchants API" do

  context "GET /api/v1/index" do
    it "sends a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_success

      raw_merchants = JSON.parse(response.body)
      raw_merchant = raw_merchants.first

      expect(raw_merchants.count).to eq(3)
      expect(raw_merchant).to have_key("name")
    end
  end

  context "GET /api/v1/show" do
    xit "sends an individual merchant" do
      id = create(:merchant).id
      get "/api/v1/merchants/#{id}"

      expect(response).to be_success

      raw_merchant = JSON.parse(response.body)
      expect(raw_merchant["id"]).to eq(id)
      expect(raw_merchant).to have_key("name")
      expect(raw_merchant).to have_key("description")
    end
  end

  context "POST /api/v1/merchants" do
    xit "creates an merchant with valid params" do
      merchant_params = {
        name: "Runaway Jim",
        description: "That Phish song that people awkwardly dance to."
      }

      expect {
        post "/api/v1/merchants", params: merchant_params
      }.to change{merchant.count}.by(1)

      expect(response).to have_http_status(200)

    end
  end

end
