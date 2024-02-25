require 'rails_helper'

RSpec.describe Members::CreateWeeklyCollectionData, type: :service do
  describe "#call" do
    it 'should create for each member the collection unpaid' do
      member_list = create_list(:member, 3)
      weekly_collection = create(:weekly_collection)
      described_class.new(weekly_collection, member_list).call
      member_list.each do |member|
        expect(member.member_weekly_collections.count).to eq(1)
        expect(member.member_weekly_collections.first.status).to eq('unpaid')
      end
    end
  end
end
