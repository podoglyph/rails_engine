FactoryGirl.define do
  factory :invoice_item do
    association :item, factory: :item
    association :invoice, factory: :invoice
    quantity 1
    unit_price 2000
  end
end
