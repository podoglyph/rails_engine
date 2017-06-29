class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices


  def revenue(date)
    if date == nil
      invoices
      .select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .group("invoices.id")
      .order("total_revenue DESC").sum(&:total_revenue)
    else
      invoices
      .select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .where(created_at: date)
      .group("invoices.id")
      .order("total_revenue DESC").sum(&:total_revenue)
    end
  end

end
