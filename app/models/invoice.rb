class Invoice < ApplicationRecord
  validates :customer_id, :merchant_id, presence: true

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant

  # def self.successful_invoices
  #   self.select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
  #   .joins(:invoice_items, :transactions).where(transactions: {result: "success"})
  #   .group("invoices.id").order("total_revenue DESC")
  # end
end
