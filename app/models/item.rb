class Item < ApplicationRecord
  validates :name, presence: true

  belongs_to :merchant
end
