class Item < ApplicationRecord
  validates :name, presence: true

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def most_revenue
    binding.pry
  end
end
