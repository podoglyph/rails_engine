require 'rails_helper'

describe "GET /api/v1/invoices/:id/transactions" do
  it "returns a collection of transactions for invoice" do
    id = create(:invoice).id

    transaction_1 = create(:transaction, invoice_id: id)
    transaction_2 = create(:transaction, invoice_id: id)
    transaction_3 = create(:transaction, invoice_id: id)

    get "/api/v1/invoices/#{id}/transactions"

    expect(response).to be_success

    raw_transactions = JSON.parse(response.body)
    raw_transaction = raw_transactions.first

    expect(raw_transactions.count).to eq(3)
    expect(raw_transaction).to have_key("invoice_id")
    expect(raw_transaction).to have_key("credit_card_number")
    expect(raw_transaction).to have_key("result")
  end
end
