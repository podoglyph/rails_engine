require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should validate_presence_of(:invoice_id) }
  it { should validate_presence_of(:item_id) }
end
