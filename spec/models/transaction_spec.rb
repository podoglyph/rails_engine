require 'rails_helper'

RSpec.describe Transaction do
  context "validations" do
    it { should validate_presence_of(:invoice_id)}
    it { should validate_presence_of(:credit_card_number)}
    it { should validate_presence_of(:result)}
  end
end
