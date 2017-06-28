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

  context "GET /api/v1/customers/find_all?first_name" do

    it "sends all matching records" do

      customer1 = create(:customer, first_name: "Petey")
      customer2 = create(:customer, first_name: "Jorge")
      customer3 = create(:customer, first_name: "Jorge")

      get "/api/v1/customers/find_all?first_name=#{customer2.first_name}"

      expect(response).to be_success

      raw_customers = JSON.parse(response.body)
      expect(raw_customers.count).to eq(2)
    end
  end

  context "GET /api/v1/customers/find?first_name" do

    it "sends the matching record" do
      customers = create_list(:customer, 3)
      customer1 = customers.first
      customer2 = customers.last

      get "/api/v1/customers/find?first_name=#{customer1.first_name}"

      expect(response).to be_success

      raw_customer = JSON.parse(response.body)

      expect(raw_customer).to have_key("first_name")
      expect(raw_customer["first_name"]).to eq(customer1.first_name)
    end

  end

  context "GET /api/v1/customers/find?id" do

    it "sends the matching record" do
      customer = create(:customer).id

      get "/api/v1/customers/find?id=#{customer}"

      expect(response).to be_success

      raw_customer = JSON.parse(response.body)

      expect(raw_customer).to have_key("id")
      expect(raw_customer["id"]).to eq(customer)
    end

  end

  context "GET /api/v1/customers/find_all?id" do

    it "sends the matching record" do
      customers = create_list(:customer, 3)
      customer1 = customers.first.id
      get "/api/v1/customers/find_all?id=#{customer1}"

      expect(response).to be_success

      raw_customers = JSON.parse(response.body)
      raw_customer = raw_customers.first

      expect(raw_customer).to have_key("id")
      expect(raw_customer["id"]).to eq(customer1)
    end

  end

  context "GET /api/v1/customers/find?created_at" do

    it "sends the matching record" do
      customer = create(:customer, created_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/customers/find?created_at=#{customer.created_at}"

      expect(response).to be_success

      raw_customer = JSON.parse(response.body)

      expect(raw_customer).to have_key("id")
      expect(raw_customer["id"]).to eq(customer.id)
    end

  end

  context "GET /api/v1/customers/find_all?created_at" do

    it "sends the matching record" do
      customer1 = create(:customer, created_at: "2012-03-27T14:56:35.000Z")
      create(:customer, created_at: "2012-03-27T14:56:35.000Z")
      create(:customer, created_at: "2012-03-27T14:56:35.000Z")
      create_list(:customer, 3)

      get "/api/v1/customers/find_all?created_at=#{customer1.created_at}"

      expect(response).to be_success

      raw_customers = JSON.parse(response.body)
      expect(raw_customers.count).to eq(3)
    end

  end

  context "GET /api/v1/customers/find?updated_at" do

    it "sends the matching record" do
      customer = create(:customer, updated_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

      expect(response).to be_success

      raw_customer = JSON.parse(response.body)

      expect(raw_customer).to have_key("id")
      expect(raw_customer["id"]).to eq(customer.id)
    end

  end

  context "GET /api/v1/customers/find_all?updated_at" do

    it "sends the matching record" do
      customer1 = create(:customer, updated_at: "2012-03-27T14:56:35.000Z")
      create(:customer, updated_at: "2012-03-27T14:56:35.000Z")
      create(:customer, updated_at: "2012-03-27T14:56:35.000Z")
      create_list(:customer, 3)

      get "/api/v1/customers/find_all?updated_at=#{customer1.updated_at}"

      expect(response).to be_success

      raw_customers = JSON.parse(response.body)
      expect(raw_customers.count).to eq(3)
    end
  end

end
