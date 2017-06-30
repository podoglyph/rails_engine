class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants
    .select("merchants.*, transactions.count AS trans_count")
    .joins(:transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("trans_count DESC")
    .first
  end


end
