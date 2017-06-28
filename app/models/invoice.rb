class Invoice < ApplicationRecord
  validates :customer_id, :merchant_id, presence: true

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant
end
