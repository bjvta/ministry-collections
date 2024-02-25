require 'rails_helper'

RSpec.describe Fine, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:member_id) }
    it { should validate_presence_of(:fee_type_id) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:amount) }
  end
  describe 'associations' do
    it { should belong_to(:member) }
    it { should belong_to(:fee_type) }
  end

  describe "#pay" do
    it "should update the status to paid" do
      fine = create(:fine)
      expect {
        fine.pay!
      }.to change(Balance, :count).by(1)
      expect(fine.status).to eq("paid")
    end
  end
end
