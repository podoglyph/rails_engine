class Item < ApplicationRecord
  validates :name, presence: true

  has_many :invoice_items
  belongs_to :merchant
end
