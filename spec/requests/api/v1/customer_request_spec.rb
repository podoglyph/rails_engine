require 'rails_helper'

describe "Customers API" do

  context "GET /api/v1/index" do
    it "sends a list of customers" do
      create_list(:customer, 5)

      get '/api/v1/customers'

      expect(response).to be_success

      raw_customers = JSON.parse(response.body)
      raw_customer = raw_customers.first
      expect(raw_customers.count).to eq(5)
      expect(raw_customer).to have_key("first_name")
      expect(raw_customer["first_name"]).to be_a String
      expect(raw_customer).to have_key("last_name")
      expect(raw_customer["last_name"]).to be_a String
    end
  end

  context "GET /api/v1/show" do
    it "sends an individual customer" do
      id = create(:customer).id
      get "/api/v1/customers/#{id}"

      expect(response).to be_success

      raw_customer = JSON.parse(response.body)

      expect(raw_customer["id"]).to eq(id)
      expect(raw_customer).to have_key("first_name")
      expect(raw_customer["first_name"]).to be_a String
      expect(raw_customer).to have_key("last_name")
      expect(raw_customer["last_name"]).to be_a String
    end
  end

end
