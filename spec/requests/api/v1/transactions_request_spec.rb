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

end
