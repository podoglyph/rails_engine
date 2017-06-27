class Invoice < ApplicationRecord
  validates :customer_id, :merchant_id, presence: true

  belongs_to :customer
  belongs_to :merchant
end
