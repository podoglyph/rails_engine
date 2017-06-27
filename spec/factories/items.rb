FactoryGirl.define do
  factory :item do
    association :merchant, factory: :merchant
    name "MyString"
    description "MyString"
    unit_price 2000
  end
end
