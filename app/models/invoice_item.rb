class InvoiceItem < ApplicationRecord
  validates :invoice_id, :item_id, presence: true

  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  def self.successful
    joins(:transactions).merge(Transaction.successful)
  end

end
