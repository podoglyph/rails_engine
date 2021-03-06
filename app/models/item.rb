class Item < ApplicationRecord
  validates :name, presence: true

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.most_revenue(quantity)
    joins(:invoices)
      .merge(Invoice.successful)
      .group(:id)
      .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
      .limit(quantity)
  end

  def best_day
    invoices
    .select('invoices.created_at')
    .joins(:invoice_items)
    .group(:id, :created_at)
    .order("sum(invoice_items.quantity) DESC, invoices.created_at ASC")
    .limit(1)
    .first
    .created_at
  end

  def self.most_items(quantity)
    unscoped
      .select("items.*, sum(invoice_items.quantity) AS total_sold")
      .joins(:invoice_items, invoices: [:transactions])
      .where(transactions: { result: 'success' })
      .group(:id)
      .order("total_sold DESC")
      .limit(quantity)
  end
end
