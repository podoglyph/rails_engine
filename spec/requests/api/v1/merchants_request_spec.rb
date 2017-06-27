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
      expect(raw_merchant["name"]).to be_a String
    end
  end

  context "GET /api/v1/show" do
    it "sends an individual merchant" do
      id = create(:merchant).id
      get "/api/v1/merchants/#{id}"

      expect(response).to be_success

      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant["id"]).to eq(id)
      expect(raw_merchant).to have_key("name")
      expect(raw_merchant["name"]).to be_a String
    end
  end

  context "GET /api/v1/merchants/find_all?name" do

    it "sends all matching records" do

      merchants = create_list(:merchant, 3)
      merchant1 = merchants.first
      merchant2 = merchants.last

      get "/api/v1/merchants/find_all?name=#{merchant1.name}"

      expect(response).to be_success

      raw_merchants = JSON.parse(response.body)
      raw_merchant1 = raw_merchants.first

      expect(raw_merchant1).to have_key("name")
      expect(raw_merchant1).to have_key("id")
      expect(raw_merchant1["id"]).to eq(merchant1.id)
      expect(raw_merchant1["name"]).to eq(merchant1.name)
      expect(raw_merchant1).to have_key("created_at")
      expect(raw_merchant1).to have_key("updated_at")
    end
  end

  context "GET /api/v1/merchants/find?name" do

    it "sends the matching record" do
      merchants = create_list(:merchant, 3)
      merchant1 = merchants.first
      merchant2 = merchants.last

      get "/api/v1/merchants/find?name=#{merchant1.name}"

      expect(response).to be_success

      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant).to have_key("name")
      expect(raw_merchant).to have_key("id")
      expect(raw_merchant["id"]).to eq(merchant1.id)
      expect(raw_merchant["name"]).to eq(merchant1.name)
      expect(raw_merchant).to have_key("created_at")
      expect(raw_merchant).to have_key("updated_at")
    end

  end

  context "GET /api/v1/merchants/find?id" do

    it "sends the matching record" do
      merchant = create(:merchant).id

      get "/api/v1/merchants/find?id=#{merchant}"

      expect(response).to be_success

      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant).to have_key("id")
      expect(raw_merchant["id"]).to eq(merchant)
    end

  end

  context "GET /api/v1/merchants/find_all?id" do

    it "sends the matching record" do
      merchants = create_list(:merchant, 3)
      merchant1 = merchants.first.id
      get "/api/v1/merchants/find_all?id=#{merchant1}"

      expect(response).to be_success

      raw_merchants = JSON.parse(response.body)
      raw_merchant = raw_merchants.first

      expect(raw_merchant).to have_key("id")
      expect(raw_merchant["id"]).to eq(merchant1)
    end

  end

  context "GET /api/v1/merchants/find?created_at" do

    it "sends the matching record" do
      merchant = create(:merchant, created_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      expect(response).to be_success

      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant).to have_key("created_at")
      expect(raw_merchant["id"]).to eq(merchant.id)
    end

  end

  context "GET /api/v1/merchants/find_all?created_at" do

    it "sends the matching record" do
      merchant1 = create(:merchant, created_at: "2012-03-27T14:56:35.000Z")
      create(:merchant, created_at: "2012-03-27T14:56:35.000Z")
      create(:merchant, created_at: "2012-03-27T14:56:35.000Z")
      create_list(:merchant, 3)

      get "/api/v1/merchants/find_all?created_at=#{merchant1.created_at}"

      expect(response).to be_success

      raw_merchants = JSON.parse(response.body)
      expect(raw_merchants.count).to eq(3)
    end

  end

  context "GET /api/v1/merchants/find?updated_at" do

    it "sends the matching record" do
      merchant = create(:merchant, updated_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

      expect(response).to be_success

      raw_merchant = JSON.parse(response.body)

      expect(raw_merchant).to have_key("updated_at")
      expect(raw_merchant["id"]).to eq(merchant.id)
    end

  end

  context "GET /api/v1/merchants/find_all?updated_at" do

    it "sends the matching record" do
      merchant1 = create(:merchant, updated_at: "2012-03-27T14:56:35.000Z")
      create(:merchant, updated_at: "2012-03-27T14:56:35.000Z")
      create(:merchant, updated_at: "2012-03-27T14:56:35.000Z")
      create_list(:merchant, 3)

      get "/api/v1/merchants/find_all?updated_at=#{merchant1.updated_at}"

      expect(response).to be_success

      raw_merchants = JSON.parse(response.body)
      expect(raw_merchants.count).to eq(3)
    end

  end

end
