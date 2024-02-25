require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:member_id) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
  describe 'associations' do
    it { should belong_to(:member) }
  end
end
