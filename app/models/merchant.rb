class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
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

  def favorite_customer
    customers
    .select("customers.*, transactions.count AS trans_count")
    .joins(:transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("trans_count DESC")
    .first
  end

  def self.revenue_by_date(date)
    joins(:invoice_items)
    .merge(InvoiceItem.successful)
    .where("invoices.created_at = '#{date}'")
    .sum("quantity * unit_price")
  end

  def self.most_items(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS number_of_items")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: { result: 'success'})
    .group(:id)
    .order("number_of_items DESC")
    .limit(quantity)
  end

  def self.most_revenue(quantity)
    joins(:invoice_items)
    .merge(InvoiceItem.successful)
    .group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .limit(quantity)
  end
end
