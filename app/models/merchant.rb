class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices


  def revenue
    invoices
    .select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items, :transactions)
    .merge(Transaction.successful)
    .group("invoices.id")
    .order("total_revenue DESC").sum(&:total_revenue)
  end

  def favorite_customer
    customers
    .select("customers.*, transactions.count AS trans_count")
    .joins(:transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("trans_count DESC")
    .first
  end
end
