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
end
