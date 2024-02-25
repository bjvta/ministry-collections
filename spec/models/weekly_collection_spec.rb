require 'rails_helper'

RSpec.describe WeeklyCollection, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:week_date) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end

  describe 'callbacks' do
    describe 'after_create' do
      let(:weekly_collection) { build(:weekly_collection) }

      it 'calls create_member_weekly_collections' do
        expect(weekly_collection).to receive(:create_member_weekly_collections).once
        weekly_collection.save
      end
    end
  end
end