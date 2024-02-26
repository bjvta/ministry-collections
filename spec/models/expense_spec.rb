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

  describe 'callbacks' do
    describe 'after_create' do
      let(:member) { create(:member) }
      let(:expense) { build(:expense, member: member) }

      it 'calls insert_into_balance' do
        expect(expense).to receive(:insert_into_balance)
        expense.save!
      end
    end
  end

  describe 'private methods' do
    describe '#insert_into_balance' do
      let(:expense) { create(:expense) }

      it 'calls Balances::InsertRow.new.perform' do
        expect(Balances::InsertRow).to receive(:new).with(expense).and_return(double(perform: true))
        expense.send(:insert_into_balance)
      end
    end
  end
end