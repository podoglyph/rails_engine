class InvoiceItem < ApplicationRecord
  validates :invoice_id, :item_id, presence: true

  belongs_to :item
  belongs_to :invoice
end
