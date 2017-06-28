class InvoiceItem < ApplicationRecord
  validates :invoice_id, :item_id, presence: true

  belongs_to :item
  belongs_to :invoice

  def self.successful
    self.joins(:invoice_items, :transactions).where(transactions: {result: "success"})
  end

end
