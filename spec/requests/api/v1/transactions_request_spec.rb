require 'rails_helper'

describe "Transactions API" do

  context "GET /api/v1/index" do
    it "sends a list of transactions" do
      create_list(:transaction, 3)

      get '/api/v1/transactions'

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      raw_transaction = raw_transactions.first
      expect(raw_transactions.count).to eq(3)
      expect(raw_transaction).to have_key("invoice_id")
      expect(raw_transaction["invoice_id"]).to be_a Integer
      expect(raw_transaction).to have_key("credit_card_number")
      expect(raw_transaction["credit_card_number"]).to be_a String
      expect(raw_transaction).to have_key("result")
      expect(raw_transaction["result"]).to be_a String
    end
  end

  context "GET /api/v1/show" do
    it "sends an individual transaction" do
      id = create(:transaction).id
      get "/api/v1/transactions/#{id}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction["id"]).to eq(id)
      expect(raw_transaction).to have_key("invoice_id")
      expect(raw_transaction["invoice_id"]).to be_a Integer
      expect(raw_transaction).to have_key("credit_card_number")
      expect(raw_transaction["credit_card_number"]).to be_a String
      expect(raw_transaction).to have_key("result")
      expect(raw_transaction["result"]).to be_a String
    end
  end

  context "GET /api/v1/transactions/find_all?invoice_id" do

    it "sends all matching records" do

      transactions = create_list(:transaction, 3)
      transaction1 = transactions.first
      transaction2 = transactions.last

      get "/api/v1/transactions/find_all?name=#{transaction1.invoice_id}"

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      raw_transaction1 = raw_transactions.first

      expect(raw_transaction1).to have_key("invoice_id")
      expect(raw_transaction1["invoice_id"]).to eq(transaction1.invoice_id)
    end
  end

  context "GET /api/v1/transactions/find?invoice_id" do

    it "sends the matching record" do
      transactions = create_list(:transaction, 3)
      transaction1 = transactions.first
      transaction2 = transactions.last

      get "/api/v1/transactions/find?name=#{transaction1.invoice_id}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction).to have_key("invoice_id")
      expect(raw_transaction["invoice_id"]).to eq(transaction1.invoice_id)
    end

  end

  context "GET /api/v1/transactions/find?id" do

    it "sends the matching record" do
      transaction = create(:transaction).id

      get "/api/v1/transactions/find?id=#{transaction}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction).to have_key("id")
      expect(raw_transaction["id"]).to eq(transaction)
    end

  end

  context "GET /api/v1/transactions/find_all?id" do

    it "sends the matching record" do
      transactions = create_list(:transaction, 3)
      transaction1 = transactions.first.id
      get "/api/v1/transactions/find_all?id=#{transaction1}"

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      raw_transaction = raw_transactions.first

      expect(raw_transaction).to have_key("id")
      expect(raw_transaction["id"]).to eq(transaction1)
    end

  end

  context "GET /api/v1/transactions/find?created_at" do

    it "sends the matching record" do
      transaction = create(:transaction, created_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction).to have_key("created_at")
      expect(raw_transaction["id"]).to eq(transaction.id)
    end

  end

  context "GET /api/v1/transactions/find_all?created_at" do

    it "sends the matching record" do
      transaction1 = create(:transaction, created_at: "2012-03-27T14:56:35.000Z")
      create(:transaction, created_at: "2012-03-27T14:56:35.000Z")
      create(:transaction, created_at: "2012-03-27T14:56:35.000Z")
      create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?created_at=#{transaction1.created_at}"

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      expect(raw_transactions.count).to eq(3)
    end

  end

  context "GET /api/v1/transactions/find?updated_at" do

    it "sends the matching record" do
      transaction = create(:transaction, updated_at: "2012-03-27T14:54:05.000Z")

      get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction).to have_key("updated_at")
      expect(raw_transaction["id"]).to eq(transaction.id)
    end

  end

  context "GET /api/v1/transactions/find_all?updated_at" do

    it "sends the matching record" do
      transaction1 = create(:transaction, updated_at: "2012-03-27T14:56:35.000Z")
      create(:transaction, updated_at: "2012-03-27T14:56:35.000Z")
      create(:transaction, updated_at: "2012-03-27T14:56:35.000Z")
      create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?updated_at=#{transaction1.updated_at}"

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      expect(raw_transactions.count).to eq(3)
    end
  end

  context "GET /api/v1/transactions/find?credit_card_number" do

    it "sends the matching record" do
      transaction = create(:transaction).credit_card_number

      get "/api/v1/transactions/find?credit_card_number=#{transaction}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction).to have_key("credit_card_number")
      expect(raw_transaction["credit_card_number"]).to eq(transaction)
    end

  end

  context "GET /api/v1/transactions/find_all?credit_card_number" do

    it "sends the matching record" do
      transactions = create_list(:transaction, 3)
      transaction1 = transactions.first.credit_card_number
      get "/api/v1/transactions/find_all?credit_card_number=#{transaction1}"

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      raw_transaction = raw_transactions.first

      expect(raw_transaction).to have_key("credit_card_number")
      expect(raw_transaction["credit_card_number"]).to eq(transaction1)
    end

  end

  context "GET /api/v1/transactions/find?result" do

    it "sends the matching record" do
      transaction = create(:transaction).result

      get "/api/v1/transactions/find?result=#{transaction}"

      expect(response).to be_success

      raw_transaction = JSON.parse(response.body)

      expect(raw_transaction).to have_key("result")
      expect(raw_transaction["result"]).to eq(transaction)
    end

  end

  context "GET /api/v1/transactions/find_all?result" do

    it "sends the matching record" do
      transactions = create_list(:transaction, 3)
      transaction1 = transactions.first.result
      get "/api/v1/transactions/find_all?result=#{transaction1}"

      expect(response).to be_success

      raw_transactions = JSON.parse(response.body)
      raw_transaction = raw_transactions.first

      expect(raw_transaction).to have_key("result")
      expect(raw_transaction["result"]).to eq(transaction1)
    end

  end

end
