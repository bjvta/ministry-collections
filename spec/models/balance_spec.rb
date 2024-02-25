require 'rails_helper'

RSpec.describe Balance, type: :model do
  describe "validations" do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:member_id) }
    it { should validate_presence_of(:income_type) }
    it { should validate_presence_of(:previous_balance) }
    it { should validate_presence_of(:current_balance) }    
  end

  describe 'associations' do
    it { should belong_to(:member) }
  end
end
